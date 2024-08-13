import { Global, Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { TopicModule } from 'src/topic/topic.module';
import { LeetcodeService } from './leetcode.service';
import { AuthModule } from 'src/auth/auth.module';
import { ProblemService } from './problem.service';
@Global()
@Module({
  imports: [HttpModule, TopicModule,AuthModule],
  controllers: [UserController],
  providers: [UserService, LeetcodeService,ProblemService],
  exports: [UserService],
})
export class UserModule {}
