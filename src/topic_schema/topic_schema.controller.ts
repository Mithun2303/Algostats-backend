import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { TopicSchemaService } from './topic_schema.service';
import { Prisma } from '@prisma/client';

@Controller('topic-schema')
export class TopicSchemaController {
  constructor(private readonly topicSchemaService: TopicSchemaService) {}

  @Post()
  create(@Body() createTopicSchemaDto: Prisma.Topic_SchemaCreateInput) {
    return this.topicSchemaService.create(createTopicSchemaDto);
  }

  @Get()
  findAll() {
    return this.topicSchemaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.topicSchemaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTopicSchemaDto: Prisma.Topic_SchemaUpdateInput) {
    return this.topicSchemaService.update(+id, updateTopicSchemaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.topicSchemaService.remove(+id);
  }
}
