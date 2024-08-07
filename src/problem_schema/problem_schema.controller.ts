import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ProblemSchemaService } from './problem_schema.service';
import { Prisma } from '@prisma/client';

@Controller('problem-schema')
export class ProblemSchemaController {
  constructor(private readonly problemSchemaService: ProblemSchemaService) {}

  @Post()
  create(@Body() createProblemSchemaDto: Prisma.Problem_SchemaCreateInput) {
    return this.problemSchemaService.create(createProblemSchemaDto);
  }

  @Get()
  findAll() {
    return this.problemSchemaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.problemSchemaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateProblemSchemaDto: Prisma.Problem_SchemaUpdateInput) {
    return this.problemSchemaService.update(+id, updateProblemSchemaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.problemSchemaService.remove(+id);
  }
}
