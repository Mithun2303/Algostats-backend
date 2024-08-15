import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/user/leetcode.service';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { TopicService } from './topic.service';

@Injectable()
export class UserService {
  constructor(
    private readonly databaseService: DatabaseService,
  ) {}

  async getOne(email: string):Promise<UserResponseDto> {
    return await this.databaseService.user.findUnique({
      where: {
        email
       },
    });
  }

  async getOneById(id: string):Promise<UserResponseDto> {
    return await this.databaseService.user.findUnique({
      where: {
        id
       },
    });
  }
  
  async updateBackupTime(id:string){
    return this.databaseService.user.update({
      where:{
        id
      },
      data:{
        lastBackupTime:new Date()
      }
    })
  }
  
}
