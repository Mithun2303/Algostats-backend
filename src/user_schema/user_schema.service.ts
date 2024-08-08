import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';


@Injectable()
export class UserSchemaService {
  constructor(
    private readonly databaseService: DatabaseService,
  ) {}
  async create(createUserSchemaDto: Prisma.UsersCreateInput) {
    const response = await this.databaseService.users.findUnique({
      where: {
        id: createUserSchemaDto.id,
      },
    });
    if (response) {
      return response;
    }
    return this.databaseService.users.create({
      data: createUserSchemaDto,
    });
  }

  async findAll() {
    return `This action returns all userSchema`;
  }

  async findOne(id: number) {
    return `This action returns a #${id} userSchema`;
  }

  async update(id: string, updateUserSchemaDto: Prisma.UsersUpdateInput) {
    return this.databaseService.users.update({
      where: {
        id,
      },
      data: updateUserSchemaDto,
    });
  }

  async remove(id: number) {
    return `This action removes a #${id} userSchema`;
  }

  async generateBackup(id: string) {
    const user = await this.databaseService.users.findFirst({
      where: { AND: [{ id: id }, { leetcode: { not: null } }] },
    });
    const leetcode_id = user.leetcode;
    // const problem_list = <Object> this.leetcodeService.getUserProblems(
    //   leetcode_id,
    //   user.lastBackupTime,
    // );
    // return problem_list;
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
