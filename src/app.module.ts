import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserSchemaModule } from './user_schema/user_schema.module';

@Module({
  imports: [DatabaseModule, UserSchemaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
