import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import {
  ApiExtraModels,
  ApiOkResponse,
  ApiResponse,
  ApiTags,
  ApiUnauthorizedResponse,
  getSchemaPath,
} from '@nestjs/swagger';
import {
  UserLoginDto,
  UserLoginResponseDto,
  UserRegisterDto,
  UserResponseDto,
} from './dto/auth.dto';

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
  async register(@Body() body: UserRegisterDto) {
    return new UserResponseDto(await this.authService.register(body));
  }
}
