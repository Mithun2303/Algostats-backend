import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ParseIntPipe,
} from '@nestjs/common';
import { UserService } from './user.service';
import { Prisma } from '@prisma/client';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('user')
@Controller('user')
export class UserSchemaController {
  constructor(private readonly userSchemaService: UserService) {}

  @Post()
  create(@Body() createUserSchemaDto: Prisma.UserCreateInput) {
    return this.userSchemaService.create(createUserSchemaDto);
  }

  @Get()
  findAll() {
    return this.userSchemaService.findAll();
  }


  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateUserSchemaDto: Prisma.UserUpdateInput,
  ) {
    return this.userSchemaService.update(id, updateUserSchemaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userSchemaService.remove(+id);
  }

  @Get('problem/:id')
  scrape_problem(@Param('id') id: string) {
    return this.userSchemaService.generateBackup(id);
  }
}
