import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserSchemaModule } from './user_schema/user_schema.module';
import { ClassSchemaModule } from './class_schema/class_schema.module';

@Module({
  imports: [DatabaseModule, UserSchemaModule, ClassSchemaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
