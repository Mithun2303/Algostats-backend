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
} from '@nestjs/common';
import { AuthService } from './auth.service';
import {
  ApiBearerAuth,
  ApiBody,
  ApiConsumes,
  ApiExtraModels,
  ApiOkResponse,
  ApiResponse,
  ApiTags,
  ApiUnauthorizedResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import {
  ReturnDto,
  UpdatePrDto,
  UserLoginDto,
  UserLoginResponseDto,
  UserRegisterDto,
  UserRegisterSingleDto,
  UserResponseDto,
} from './dto/auth.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import  * as fs  from 'fs';
import * as csv from 'csv-parser';
import { LoggedInUser } from 'src/user/decorator/loggedIn.decorator';
import { AuthGaurd } from './gaurd/auth.gaurd';
import AllowedRoles, { AllowAllRoles } from 'src/user/decorator/allowedRoles.decorator';
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
  @Post('/register')
  async register(@Body() body: UserRegisterSingleDto) {
    return new UserResponseDto(await this.authService.register(body));
  }


  @Post('bulkregister')
  @UseInterceptors(FileInterceptor('file'))
  @ApiConsumes("multipart/form-data")
  @ApiBearerAuth()
  @AllowedRoles([UserRole.TUTOR])
  @UseGuards(AuthGaurd)
  @ApiBody({
    required: true,
    schema: {
      type: "object",
      properties: {
        file: {
          type: "file",
          format: "csv",
        }
      }
    }
  })
  async bulkRegister(@UploadedFile( 
    new ParseFilePipeBuilder()
    .addFileTypeValidator({fileType:'text/csv'})
    .build({ errorHttpStatusCode: HttpStatus.UNPROCESSABLE_ENTITY })) file,
    @LoggedInUser() userDet:UserResponseDto){
      
    console.log(userDet);

    const path = "server/uploads/86245cd016876fe468da0316fe8e8e87"
    let users = [];
    const user = await fs.createReadStream(file.path)
      .pipe(csv())
      .on('data', (row) => {
        users.push(row);
      })
      .on('end', async () => {
        this.authService.registerBulk(users,userDet)
        fs.unlinkSync(file.path); // Optionally delete the file after processing
      });
  }


  @Post('assign/pr')
  @ApiBearerAuth()
  @AllowedRoles([UserRole.TUTOR])
  @UseGuards(AuthGaurd)
  async assignPR(@LoggedInUser() tutorDet:UserResponseDto,@Body() prs:string[]){
    // const ids = prs.map((elt)=>elt.id)
    // const response = await Promise.all(ids);
    return new ReturnDto(await this.authService.updatePr(tutorDet,prs));
  }
  
  // @Post('/register/bulk')
  // async registerBulk(@Body)
}
