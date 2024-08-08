import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class ClassService {
  constructor(private readonly databaseService:DatabaseService){}
  create(createClassDto: Prisma.ClassCreateInput) {
    return this.databaseService.class.create({data:createClassDto})
  }

  findAll() {
    return `This action returns all class`;
  }

  findOne(id: string) {
    return this.databaseService.class.findMany({
      where:{
        id:id
      }
    });
  }

  update(id: string, updateClassDto: Prisma.ClassUpdateInput) {
    return this.databaseService.class.update({
      where:{
        id,
      },
      data:updateClassDto
    })
  }

  remove(id: string) {
    return `This action removes a #${id} class`;
  }
}
