import { Module } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { UserSchemaController } from './user_schema.controller';
import { HttpModule, HttpService } from '@nestjs/axios';

@Module({
  imports:[HttpModule],
  controllers: [UserSchemaController],
  providers: [UserSchemaService,],
})
export class UserSchemaModule {}
