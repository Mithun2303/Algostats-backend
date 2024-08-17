import { Injectable, NotFoundException } from '@nestjs/common';
import { UserService } from './user/user.service';
import { LeetcodeService } from './user/leetcode.service';
import { ProblemService } from './user/problem.service';
import { Cron, CronExpression } from '@nestjs/schedule';

@Injectable()
export class AppService {
  constructor() {}
  getHello(): string {
    return 'Hello World!';
  }
}
