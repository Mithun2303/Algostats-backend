import { Module } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { UserSchemaController } from './user_schema.controller';

@Module({
  controllers: [UserSchemaController],
  providers: [UserSchemaService],
})
export class UserSchemaModule {}
