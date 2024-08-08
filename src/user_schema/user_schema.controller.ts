import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { UserSchemaService } from './user_schema.service';
import { Prisma } from '@prisma/client';

@Controller('user')
export class UserSchemaController {
  constructor(private readonly userSchemaService: UserSchemaService) {}

  @Post()
  create(@Body() createUserSchemaDto: Prisma.User_SchemaCreateInput) {
    return this.userSchemaService.create(createUserSchemaDto);
  }

  @Get()
  findAll() {
    return this.userSchemaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.userSchemaService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserSchemaDto: Prisma.User_SchemaUpdateInput) {
    return this.userSchemaService.update(id, updateUserSchemaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userSchemaService.remove(+id);
  }

  @Get('problem/:id')
  scrape_problem(@Param("id") id:string){
    return this.userSchemaService.generateBackup(id)
  }
}
