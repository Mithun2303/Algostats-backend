import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserSchemaModule } from './user_schema/user_schema.module';
import { ClassModule } from './class/class.module';
import { TopicModule } from './topic/topic.module';

@Module({
  imports: [DatabaseModule, UserSchemaModule,ClassModule, TopicModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
