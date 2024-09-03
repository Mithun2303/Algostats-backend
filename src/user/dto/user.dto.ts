import { Expose } from 'class-transformer';
import { DifficultyLevels } from './problem.dto';
import { IsNotEmpty, isNotEmpty, IsString } from 'class-validator';

export enum UserRole {
  STUDENT = 'STUDENT',
  PLACEMENT_REPRESENTATIVE = 'PLACEMENT_REPRESENTATIVE',
  TUTOR = 'TUTOR',
  COURSE_COORDINATOR = 'COURSE_COORDINATOR',
  PLACEMENT_COORDINATOR = 'PLACEMENT_COORDINATOR',
}

export class UserProblemResponseDto {
  constructor(partial: Partial<UserProblemResponseDto> | Partial<Event>) {
    Object.assign(this, partial);
  }
  @Expose()
  @IsString()
  name: string;

  @Expose()
  @IsString()
  difficulty: string;
}


export class UserProblemDto{
  @IsString()
  @IsNotEmpty()
  id:string
}