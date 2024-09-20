import { Expose } from 'class-transformer';
import { IsArray, IsBoolean, IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class AttendanceListDTO {
  @Expose()
  @IsString()
  id: string;
  @Expose()
  @IsString()
  name: string;

  constructor(data: Partial<AttendanceListDTO> | Partial<Event>) {
    Object.assign(this, data);
  }
}

export class AttendanceDTO {
  @Expose()
  @IsArray()
  @IsNotEmpty()
  id: string[];

  @Expose()
  @IsNotEmpty()
  @IsBoolean()
  allPresent: boolean;

  @Expose()
  @IsBoolean()
  @IsNotEmpty()
  present: boolean;

  @Expose()
  @IsString()
  @IsNotEmpty()
  description:string;
}

export class UserAttendanceDTO{
  @Expose()
  @IsNumber()
  present: number;
  @Expose()
  @IsNumber()
  total: number;

  constructor(data: Partial<UserAttendanceDTO> | Partial<Event>) {
    Object.assign(this, data);
  }
}
