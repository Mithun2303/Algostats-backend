import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';


@Injectable()
export class ClassSchemaService {
  constructor(private readonly databaseService:DatabaseService){}
  create(createClassSchemaDto: Prisma.Class_SchemaCreateInput) {
    return this.databaseService.class_Schema.create({data:createClassSchemaDto})
  }

  findAll() {
    return `This action returns all classSchema`;
  }

  findOne(id: number) {
    return `This action returns a #${id} classSchema`;
  }

  update(id: number, updateClassSchemaDto: Prisma.Class_SchemaUpdateInput) {
    return `This action updates a #${id} classSchema`;
  }

  remove(id: number) {
    return `This action removes a #${id} classSchema`;
  }
}
