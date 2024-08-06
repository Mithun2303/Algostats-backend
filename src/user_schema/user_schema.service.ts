import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class UserSchemaService {
  constructor(private readonly databaseService:DatabaseService){}
  async create(createUserSchemaDto: Prisma.User_SchemaCreateInput) {
    const response = await this.databaseService.user_Schema.findUnique({
      where:{
        id:createUserSchemaDto.id,
      }})
      if(response){
        return response
      }
    return this.databaseService.user_Schema.create({data:createUserSchemaDto})
  }

  async findAll() {
    return `This action returns all userSchema`;
  }

  async findOne(id: number) {
    return `This action returns a #${id} userSchema`;
  }

  async update(id: string, updateUserSchemaDto: Prisma.User_SchemaUpdateInput) {
    return this.databaseService.user_Schema.update({
      where:{
        id,
      },
      data:updateUserSchemaDto
    })
  }

  async remove(id: number) {
    return `This action removes a #${id} userSchema`;
  }
}
