import { IsEmail, IsNotEmpty, IsString, ValidateNested } from 'class-validator';
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
  password: string;

  @IsString()
  linkedIn: string;

  @IsString()
  github: string;

  @IsString()
  leetcode: string;

  @IsString()
  class:string

  @IsString()
  stream:string

  @IsString()
  batch:string


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
  @IsNotEmpty()
  class: string;

  @Expose()
  @IsString()
  stream:string
  
  @Expose()
  @IsString()
  batch:string
  constructor(partial: Partial<UserResponseDto> | Partial<Event>) {
    Object.assign(this, partial);
  }
}

export class UserLoginResponseDto{
  @Expose()
  @IsString()
  token:string

  @Expose()
  @IsString()
  id:string

  @Expose()
  @IsString()
  @IsNotEmpty()
  class: string;

  @Expose()
  @IsString()
  stream:string
  
  @Expose()
  @IsString()
  batch:string

  constructor(partial:Partial<UserLoginResponseDto>|Partial<Event> ){
    Object.assign(this,partial)
  }
}
