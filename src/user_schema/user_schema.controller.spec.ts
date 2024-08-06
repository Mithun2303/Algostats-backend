import { Test, TestingModule } from '@nestjs/testing';
import { UserSchemaController } from './user_schema.controller';
import { UserSchemaService } from './user_schema.service';

describe('UserSchemaController', () => {
  let controller: UserSchemaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UserSchemaController],
      providers: [UserSchemaService],
    }).compile();

    controller = module.get<UserSchemaController>(UserSchemaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
