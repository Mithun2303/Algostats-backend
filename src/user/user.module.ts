import { Global, Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserSchemaController } from './user.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { TopicModule } from 'src/topic/topic.module';
import { LeetcodeService } from './leetcode.service';
@Global()
@Module({
  imports: [HttpModule, TopicModule],
  controllers: [UserSchemaController],
  providers: [UserService,LeetcodeService],
  exports:[UserService]
})
export class UserSchemaModule {}
