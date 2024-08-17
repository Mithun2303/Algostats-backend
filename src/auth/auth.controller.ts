import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UploadedFile,
  UseInterceptors,
  ParseFilePipe,
  FileTypeValidator,
  ParseFilePipeBuilder,
  HttpStatus,
  UseGuards,
  ForbiddenException,
  BadRequestException,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiExtraModels,
  ApiForbiddenResponse,
  ApiOkResponse,
  ApiResponse,
  ApiTags,
  ApiUnauthorizedResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import {
  ChangePasswordDto,
  UpdatePrDto,
  UserLoginDto,
  UserLoginResponseDto,
  UserRegisterDto,
  UserRegisterSingleDto,
  UserResponseDto,
} from './dto/auth.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import * as fs from 'fs';
import * as csv from 'csv-parser';
import { LoggedInUser } from 'src/user/decorator/loggedIn.decorator';
import { AuthGaurd } from './gaurd/auth.gaurd';
import AllowedRoles, {
  AllowAllRoles,
} from 'src/user/decorator/allowedRoles.decorator';
import { UserRole } from 'src/user/dto/user.dto';

@ApiTags('auth')
@Controller('auth')
@ApiExtraModels(UserResponseDto, UserRegisterDto)
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/login')
  async create(@Body() createAuthDto: UserLoginDto) {
    return new UserLoginResponseDto(
      await this.authService.login(createAuthDto),
    );
  }

  @ApiUnauthorizedResponse({
    description: 'The user already exists',
    schema: {
      $ref: getSchemaPath(UserResponseDto),
    },
  })
  @ApiOkResponse({
    schema: {
      $ref: getSchemaPath(UserRegisterDto),
    },
  })
  @ApiForbiddenResponse({
    description: 'Inconsistent data encountered',
    schema: {
      $ref: getSchemaPath(UserRegisterSingleDto),
    },
  })
  @AllowedRoles([UserRole.PLACEMENT_COORDINATOR, UserRole.COURSE_COORDINATOR])
  @UseGuards(AuthGaurd)
  @ApiBearerAuth()
  @Post('/register')
  async register(
    @Body() body: UserRegisterSingleDto,
    @LoggedInUser() user: UserResponseDto,
  ) {
    if (user.role == UserRole.COURSE_COORDINATOR) {
      if (body.stream == user.stream) {
        return new UserResponseDto(await this.authService.register(body));
      } else {
        throw new ForbiddenException(
          'You are unauthorised to access other streams',
        );
      }
    } else {
      return new UserResponseDto(await this.authService.register(body));
    }
  }

  @Post('bulkregister')
  @UseInterceptors(FileInterceptor('file'))
  @ApiConsumes('multipart/form-data')
  @ApiBearerAuth()
  @AllowedRoles([UserRole.TUTOR])
  @UseGuards(AuthGaurd)
  @ApiBody({
    required: true,
    schema: {
      type: 'object',
      properties: {
        file: {
          type: 'file',
          format: 'csv',
        },
      },
    },
  })
  async bulkRegister(
    @UploadedFile(
      new ParseFilePipeBuilder()
        .addFileTypeValidator({ fileType: 'text/csv' })
        .build({ errorHttpStatusCode: HttpStatus.UNPROCESSABLE_ENTITY }),
    )
    file,
    @LoggedInUser() userDet: UserResponseDto,
  ) {
    const path = 'server/uploads/86245cd016876fe468da0316fe8e8e87';
    let users = [];
    const user = await fs
      .createReadStream(file.path)
      .pipe(csv())
      .on('data', (row) => {
        users.push(row);
      })
      .on('end', async () => {
        this.authService.registerBulk(users, userDet);
        fs.unlinkSync(file.path); 
      });
  }

  @Post('assign/pr')
  @ApiBearerAuth()
  @AllowedRoles([
    UserRole.TUTOR,
    UserRole.PLACEMENT_COORDINATOR,
    UserRole.COURSE_COORDINATOR,
  ])
  @UseGuards(AuthGaurd)
  async assignPR(
    @LoggedInUser() userDet: UserResponseDto,
    @Body() body: UpdatePrDto,
  ) {
    if (userDet.role == UserRole.TUTOR) {
      return this.authService.updatePr({
        prs: body.id,
        class: userDet.class,
        batch: userDet.batch,
        stream: userDet.stream,
      });
    } else if (userDet.role == UserRole.COURSE_COORDINATOR) {
      return this.authService.updatePr({
        prs: body.id,
        class: body.class,
        batch: body.batch,
        stream: userDet.stream,
      });
    } else {
      console.log(
        await this.authService.updatePr({
          prs: body.id,
          class: body.class,
          batch: body.batch,
          stream: body.stream,
        }),
      );
    }
  }
  @ApiOkResponse()
  @Post('change-password')
  @AllowAllRoles
  @UseGuards(AuthGaurd)
  @ApiBearerAuth()
  async changePassword(
    @Body() body: ChangePasswordDto,
    @LoggedInUser() user: UserResponseDto,
  ) {
    return new UserResponseDto(
      await this.authService.changePassword({
        id: user.id,
        password: body.password,
      }),
    );
  }

}
