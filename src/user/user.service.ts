import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/user/leetcode.service';
import { TopicService } from 'src/topic/topic.service';

@Injectable()
export class UserService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly leetcodeService: LeetcodeService,
    private readonly topicService: TopicService,
  ) {}
  async create(createUserchemaDto: Prisma.UserCreateInput) {
    return this.databaseService.user.create({
      data: createUserchemaDto,
    });
  }

  async findAll() {
    return `This action returns all userchema`;
  }

  async getOne(email) {
    return await this.databaseService.user.findUnique({
      where:{
        email:email
      }
    })
  }

  async update(id: string, updateUserchemaDto: Prisma.UserUpdateInput) {
    return this.databaseService.user.update({
      where: {
        id,
      },
      data: updateUserchemaDto,
    });
  }

  async remove(id: number) {
    return `This action removes a #${id} userchema`;
  }

  async generateBackup(id: string) {
    const user = await this.databaseService.user.findFirst({
      where: { AND: [{ id: id }, { leetcode: { not: null } }] },
    });
    // const leetcode_id = user.leetcode;
    const problem_list = await this.leetcodeService.listRecentProblem(user);
    problem_list.forEach(async (problem) => {
      const val = await this.databaseService.problem.findFirst({
        where: {
          id: problem.id,
        },
      });

      if (val == null) {
        const difficulty = await this.leetcodeService.problemDifficulty(
          problem.titleSlug,
        );
        const topics = await this.leetcodeService.problemTopics(
          problem.titleSlug,
        );
        if (topics.length > 0) {
          topics.forEach(async (topic) => {
            try {
              await this.topicService.create({ id: topic.name });
            } catch (error) {
              console.log(error);
            }
          });
        }
      }
    });
    return problem_list;
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
