import {
  IsDate,
  IsEmail,
  IsNotEmpty,
  IsString,
  ValidateNested,
} from 'class-validator';
import { Expose, Type } from 'class-transformer';

export class UserLoginDto {
  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;
}

export class UserRegisterDto {
  @IsString()
  @IsNotEmpty()
  id: string;

  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  leetcode: string;
}

export class UserRegisterSingleDto {
  @IsString()
  @IsNotEmpty()
  id: string;

  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  role: string;

  @IsString()
  class: string;

  @IsNotEmpty()
  @IsString()
  stream: string;

  @IsString()
  batch: string;
}

export class UserResponseDto {
  @Expose()
  @IsString()
  @IsNotEmpty()
  id: string;

  @Expose()
  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @Expose()
  @IsString()
  linkedIn: string;

  @Expose()
  @IsString()
  github: string;

  @Expose()
  @IsString()
  leetcode: string;

  @Expose()
  @IsString()
  class: string;

  @Expose()
  @IsString()
  stream: string;

  @Expose()
  @IsString()
  role: string;

  @IsDate()
  lastBackupTime;

  @Expose()
  @IsString()
  batch: string;
  constructor(partial: Partial<UserResponseDto> | Partial<Event>) {
    Object.assign(this, partial);
  }
}

export class UserLoginResponseDto {
  @Expose()
  @IsString()
  token: string;

  @Expose()
  @IsString()
  id: string;

  @Expose()
  @IsString()
  @IsNotEmpty()
  class: string;

  @Expose()
  @IsString()
  stream: string;

  @Expose()
  @IsString()
  batch: string;

  constructor(partial: Partial<UserLoginResponseDto> | Partial<Event>) {
    Object.assign(this, partial);
  }
}

export class UpdatePrDto {
  @IsNotEmpty()
  @IsString()
  id: string[];

  @IsString()
  stream: string;

  @IsString()
  batch: string;

  @IsString()
  class: string;
}

export class ChangePasswordDto{
  @IsNotEmpty()
  @IsString()
  password:string
}

export class UpdatePasswordDto{
  @IsNotEmpty()
  @IsString()
  id:string

  @IsNotEmpty()
  @IsString()
  password:string
}