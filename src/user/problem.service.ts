import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/user/leetcode.service';
import { TopicService } from 'src/topic/topic.service';

@Injectable()
export class ProblemService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly leetcodeService: LeetcodeService,
    private readonly topicService: TopicService,
  ) {}
  async findExcluded(data){

  }

}
