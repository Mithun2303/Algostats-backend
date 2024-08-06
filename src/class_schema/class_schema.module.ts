import { Module } from '@nestjs/common';
import { ClassSchemaService } from './class_schema.service';
import { ClassSchemaController } from './class_schema.controller';

@Module({
  controllers: [ClassSchemaController],
  providers: [ClassSchemaService],
})
export class ClassSchemaModule {}
