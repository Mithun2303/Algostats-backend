import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { Prisma } from '@prisma/client';
import { firstValueFrom } from 'rxjs';
import { HttpException, HttpStatus } from '@nestjs/common';

@Injectable()
export class LeetcodeService {
  constructor(private readonly httpService: HttpService) {}

  async listRecentProblem(user: Prisma.UsersUpdateInput) {
    console.log(user);
    const limit = 100;
    const query = `
          query recentAcSubmissions($username: String!, $limit: Int!) {
            recentAcSubmissionList(username: $username, limit: $limit) {
              id
              title
              titleSlug
              timestamp
            }
          }
        `;

    const variables = {
      username: user.leetcode,
      limit: limit,
    };

    const url = 'https://leetcode.com/graphql/';

    try {
      let result = await firstValueFrom(
        this.httpService.post(url, {
          query: query,
          variables: variables,
        }),
      );
      let list = result.data.data.recentAcSubmissionList;
      list = list.filter((element) => element.timestamp < user.lastBackupTime);

      // list.forEach(async(element) => {
      //   console.log(await this.problemDetails(element.titleSlug))
      // });

      // console.log(await this.problemDetails(result[0].titleSlug));
      return list;
    } catch (error) {
      throw new HttpException(
        'Error fetching data from third party GraphQL API',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
  async problemTopics(titleSlug: string) {
    const query = `
      query singleQuestionTopicTags($titleSlug: String!) {
        question(titleSlug: $titleSlug) {
        difficulty
          topicTags {
          slug
      }
    }
  }
    `;
    const variables = {
      titleSlug: titleSlug,
    };

    const url = 'https://leetcode.com/graphql/';
    try {
      let result = await firstValueFrom(
        this.httpService.post(url, {
          query: query,
          variables: variables,
        }),
      );
      const topics = await result.data.data.question;
      // result.forEach(element=>{
      //   this.topicSchemaService.create({id:element.name})
      // })
      console.log(topics)
      return topics;
    } catch (error) {}
  }

  async problemDifficulty(titleSlug:string){

  }
}
