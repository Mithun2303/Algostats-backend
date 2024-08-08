import { Module } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { UserSchemaController } from './user_schema.controller';
import { HttpModule, HttpService } from '@nestjs/axios';
import { ProblemSchemaModule } from 'src/problem_schema/problem_schema.module';
import { TopicSchemaModule } from 'src/topic_schema/topic_schema.module';
import Leetcode from 'src/client/client.service';
// import ClientService from 'src/client/client.service';
import { ClientModule } from 'src/client/client.module';

@Module({
  imports:[HttpModule, ProblemSchemaModule, TopicSchemaModule,ClientModule],
  controllers: [UserSchemaController],
  providers: [UserSchemaService,],
})
export class UserSchemaModule {}
