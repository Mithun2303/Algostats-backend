import { Module } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { UserSchemaController } from './user_schema.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { ProblemSchemaService } from 'src/problem_schema/problem_schema.service';
import { TopicSchemaService } from 'src/topic_schema/topic_schema.service';
import { ProblemSchemaModule } from 'src/problem_schema/problem_schema.module';
import { TopicSchemaModule } from 'src/topic_schema/topic_schema.module';

@Module({
  imports:[HttpModule, ProblemSchemaModule, TopicSchemaModule],
  providers: [UserSchemaService],
  controllers: [UserSchemaController],
})
export class UserSchemaModule {}
