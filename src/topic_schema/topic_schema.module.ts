import { Module } from '@nestjs/common';
import { TopicSchemaService } from './topic_schema.service';
import { TopicSchemaController } from './topic_schema.controller';

@Module({
  controllers: [TopicSchemaController],
  providers: [TopicSchemaService],
  exports: [TopicSchemaService]
})
export class TopicSchemaModule {}
