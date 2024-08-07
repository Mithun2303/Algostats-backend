import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserSchemaModule } from './user_schema/user_schema.module';
import { ClassSchemaModule } from './class_schema/class_schema.module';
import { ProblemSchemaModule } from './problem_schema/problem_schema.module';
import { TopicSchemaModule } from './topic_schema/topic_schema.module';
import { ClientModule } from './client/client.module';
import { LeetcodeService } from './leetcode/leetcode.service';


@Module({
  imports: [DatabaseModule, UserSchemaModule, ClassSchemaModule, ProblemSchemaModule, TopicSchemaModule, ClientModule],
  controllers: [AppController],
  providers: [AppService, LeetcodeService],
})
export class AppModule {}
