import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/leetcode/leetcode.service';
import { TopicService } from 'src/topic/topic.service';


@Injectable()
export class UserSchemaService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly leetcodeService: LeetcodeService,
    private readonly topicService: TopicService

  ) {}
  async create(createUserSchemaDto: Prisma.UsersCreateInput) {

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
    // const leetcode_id = user.leetcode;
    const problem_list = await this.leetcodeService.listRecentProblem(user);
    problem_list.forEach(async (problem) => {
      const val = await this.databaseService.problem.findFirst({
        where:{
          id:problem.id
        }
      });
      
      if(val==null){
        let difficulty = await this.leetcodeService.problemDifficulty(problem.titleSlug)
        let topics = await this.leetcodeService.problemTopics(problem.titleSlug)
        if(topics.length>0){
          topics.forEach(async (topic) => {
            try {
              await this.topicService.create({id:topic.name})
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
