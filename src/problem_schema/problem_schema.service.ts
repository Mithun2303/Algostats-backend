import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class ProblemSchemaService {
  constructor(private readonly databaseService:DatabaseService){}
  async create(createProblemSchemaDto: Prisma.Problem_SchemaCreateInput) {
    const response = await this.databaseService.problem_Schema.findUnique({
      where: {
        id: createProblemSchemaDto.id,
      },
    });
    if (response) {
      return response;
    }
    return this.databaseService.problem_Schema.create({
      data: createProblemSchemaDto,
    });
  }

  findAll() {
    return `This action returns all problemSchema`;
  }

  findOne(id: number) {
    return `This action returns a #${id} problemSchema`;
  }

  update(id: number, updateProblemSchemaDto: Prisma.Problem_SchemaUpdateInput) {
    return `This action updates a #${id} problemSchema`;
  }

  remove(id: number) {
    return `This action removes a #${id} problemSchema`;
  }
}
