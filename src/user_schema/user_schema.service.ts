import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { ProblemSchemaService } from 'src/problem_schema/problem_schema.service';
import { TopicSchemaService } from 'src/topic_schema/topic_schema.service';

@Injectable()
export class UserSchemaService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly problemSchemaService: ProblemSchemaService,
    private readonly topicSchemaService: TopicSchemaService,
  ) {}
  async create(createUserSchemaDto: Prisma.User_SchemaCreateInput) {
    const response = await this.databaseService.user_Schema.findUnique({
      where: {
        id: createUserSchemaDto.id,
      },
    });
    if (response) {
      return response;
    }
    return this.databaseService.user_Schema.create({
      data: createUserSchemaDto,
    });
  }

  async findAll() {
    return `This action returns all userSchema`;
  }

  async findOne(id: number) {
    return `This action returns a #${id} userSchema`;
  }

  async update(id: string, updateUserSchemaDto: Prisma.User_SchemaUpdateInput) {
    return this.databaseService.user_Schema.update({
      where: {
        id,
      },
      data: updateUserSchemaDto,
    });
  }

  async remove(id: number) {
    return `This action removes a #${id} userSchema`;
  }

  async findProblem(id: string) {
    const user = await this.databaseService.user_Schema.findFirst({
      where: { AND: [{ id: id }, { leetcode: { not: null } }] },
    });
  }

  // async problemDetails(titleSlug: string) {
  //     const query = `
  //     query singleQuestionTopicTags($titleSlug: String!) {
  //       question(titleSlug: $titleSlug) {
  //         topicTags {
  //         name
  //         slug
  //     }
  //   }
  // }
  //   `;
  //     const variables = {
  //       titleSlug: titleSlug,
  //     };

  //     const url = 'https://leetcode.com/graphql/';
  //     try {
  //       let result;
  //       await firstValueFrom(
  //         this.httpService.post(url, {
  //           query: query,
  //           variables: variables,
  //         }),
  //       ).then((res) => {
  //         result = res.data.data.question.topicTags;
  //       });
  //       result.forEach(element=>{
  //         this.topicSchemaService.create({id:element.name})
  //       })
  //       return "hello";
  //     } catch (error) {}
  //   }
}
