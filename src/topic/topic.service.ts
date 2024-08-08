import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class TopicService {
  constructor(private readonly databaseService: DatabaseService){}
  create(createTopicDto: Prisma.TopicCreateInput) {
    return this.databaseService.topic.create({data:createTopicDto});
  }

  findAll() {
    return `This action returns all topic`;
  }

  findOne(id: number) {
    return `This action returns a #${id} topic`;
  }

  update(id: number, updateTopicDto: Prisma.TopicUpdateInput) {
    return `This action updates a #${id} topic`;
  }

  remove(id: number) {
    return `This action removes a #${id} topic`;
  }
}
