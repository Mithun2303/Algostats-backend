import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ClassSchemaService } from './class_schema.service';
import { Prisma } from '@prisma/client';

@Controller('class-schema')
export class ClassSchemaController {
  constructor(private readonly classSchemaService: ClassSchemaService) {}

  @Post()
  create(@Body() createClassSchemaDto: Prisma.Class_SchemaCreateInput) {
    return this.classSchemaService.create(createClassSchemaDto);
  }

  @Get()
  findAll() {
    return this.classSchemaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.classSchemaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateClassSchemaDto: Prisma.Class_SchemaUpdateInput) {
    return this.classSchemaService.update(+id, updateClassSchemaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.classSchemaService.remove(+id);
  }
}
