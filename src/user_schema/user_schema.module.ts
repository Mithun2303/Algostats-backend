import { Module } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { UserSchemaController } from './user_schema.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { LeetcodeModule } from 'src/leetcode/leetcode.module';
import { TopicModule } from 'src/topic/topic.module';

@Module({
  imports:[HttpModule,LeetcodeModule,TopicModule],
  controllers: [UserSchemaController],
  providers: [UserSchemaService,],
})
export class UserSchemaModule {}
