import { Test, TestingModule } from '@nestjs/testing';
import { ClassSchemaController } from './class_schema.controller';
import { ClassSchemaService } from './class_schema.service';

describe('ClassSchemaController', () => {
  let controller: ClassSchemaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ClassSchemaController],
      providers: [ClassSchemaService],
    }).compile();

    controller = module.get<ClassSchemaController>(ClassSchemaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
