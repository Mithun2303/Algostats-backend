import { Global, Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { LeetcodeService } from './leetcode.service';
import { AuthModule } from 'src/auth/auth.module';
import { ProblemService } from './problem.service';
import { TopicService } from './topic.service';
@Global()
@Module({
  imports: [HttpModule,AuthModule],
  controllers: [UserController],
  providers: [UserService, ProblemService,LeetcodeService,TopicService],
  exports: [UserService,ProblemService],
})
export class UserModule {}
