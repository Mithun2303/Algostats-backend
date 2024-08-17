import {
  IsDate,
  IsEmail,
  IsNotEmpty,
  IsString,
  ValidateNested,
} from 'class-validator';
import { Expose } from 'class-transformer';

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
  password: string;

  @IsString()
  leetcode: string;

  @IsString()
  class: string;

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
  id: string;
}

export class ReturnDto {
  @IsNotEmpty()
  @Expose()
  count: number;

  constructor(partial:Partial<ReturnDto>|Partial<Event>){
    Object.assign(this,partial);
  }
}
