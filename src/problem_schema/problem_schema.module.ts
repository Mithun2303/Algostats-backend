import { Module } from '@nestjs/common';
import { ProblemSchemaService } from './problem_schema.service';
import { ProblemSchemaController } from './problem_schema.controller';

@Module({
  controllers: [ProblemSchemaController],
  providers: [ProblemSchemaService],
  exports: [ProblemSchemaService]
})
export class ProblemSchemaModule {}
