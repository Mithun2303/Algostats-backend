import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';


@Injectable()
export class TopicSchemaService {
  constructor (private readonly databaseService:DatabaseService){}
  async create(createTopicSchemaDto: Prisma.Topic_SchemaCreateInput) {
    const response = await this.databaseService.topic_Schema.findUnique({
      where: {
        id: createTopicSchemaDto.id,
      },
    });
    if (response) {
      return response;
    }
    return this.databaseService.topic_Schema.create({
      data: createTopicSchemaDto,
    });
  }

  findAll() {
    return `This action returns all topicSchema`;
  }

  findOne(id: number) {
    return `This action returns a #${id} topicSchema`;
  }

  update(id: number, updateTopicSchemaDto: Prisma.Topic_SchemaUpdateInput) {
    return `This action updates a #${id} topicSchema`;
  }

  remove(id: number) {
    return `This action removes a #${id} topicSchema`;
  }
}
