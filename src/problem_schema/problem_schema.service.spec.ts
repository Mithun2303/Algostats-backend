import { Test, TestingModule } from '@nestjs/testing';
import { ProblemSchemaService } from './problem_schema.service';

describe('ProblemSchemaService', () => {
  let service: ProblemSchemaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProblemSchemaService],
    }).compile();

    service = module.get<ProblemSchemaService>(ProblemSchemaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
