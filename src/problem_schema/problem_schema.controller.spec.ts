import { Test, TestingModule } from '@nestjs/testing';
import { ProblemSchemaController } from './problem_schema.controller';
import { ProblemSchemaService } from './problem_schema.service';

describe('ProblemSchemaController', () => {
  let controller: ProblemSchemaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProblemSchemaController],
      providers: [ProblemSchemaService],
    }).compile();

    controller = module.get<ProblemSchemaController>(ProblemSchemaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
