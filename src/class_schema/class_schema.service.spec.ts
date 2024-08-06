import { Test, TestingModule } from '@nestjs/testing';
import { ClassSchemaService } from './class_schema.service';

describe('ClassSchemaService', () => {
  let service: ClassSchemaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ClassSchemaService],
    }).compile();

    service = module.get<ClassSchemaService>(ClassSchemaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
