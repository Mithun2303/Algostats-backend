import { Test, TestingModule } from '@nestjs/testing';
import { TopicSchemaController } from './topic_schema.controller';
import { TopicSchemaService } from './topic_schema.service';

describe('TopicSchemaController', () => {
  let controller: TopicSchemaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [TopicSchemaController],
      providers: [TopicSchemaService],
    }).compile();

    controller = module.get<TopicSchemaController>(TopicSchemaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
