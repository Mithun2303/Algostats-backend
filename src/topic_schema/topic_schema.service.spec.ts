import { Test, TestingModule } from '@nestjs/testing';
import { TopicSchemaService } from './topic_schema.service';

describe('TopicSchemaService', () => {
  let service: TopicSchemaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TopicSchemaService],
    }).compile();

    service = module.get<TopicSchemaService>(TopicSchemaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
