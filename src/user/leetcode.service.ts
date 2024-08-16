import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { Prisma } from '@prisma/client';
import { firstValueFrom } from 'rxjs';
import { HttpException, HttpStatus } from '@nestjs/common';
import { RecentAcSubmissionList } from './dto/leetcode.dto';
import { DatabaseService } from 'src/database/database.service';
import { DifficultyPoints } from './dto/problem.dto';
import { ProblemService } from './problem.service';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { TopicService } from './topic.service';

@Injectable()
export class LeetcodeService {
  constructor(
    private readonly httpService: HttpService,
    private readonly topicService: TopicService,
    private readonly databaseService: DatabaseService,
    private readonly problemService:ProblemService
  ) {}

  async listRecentProblem(user) {
    const limit = 100;
    const query = `
    query recentAcSubmissionsWithQuestionDetails($username: String!, $limit: Int!) {
      recentAcSubmissionList(username: $username, limit: $limit) {
        id
        title
        titleSlug
        timestamp
      }
    }`;
    const variables = {
      username: user.leetcode,
      limit: limit,
    };
    const url = 'https://leetcode.com/graphql/';
    try {
      const result = (
        await firstValueFrom(
          this.httpService.post(url, {
            query: query,
            variables: variables,
          }),
        )
      ).data.data.recentAcSubmissionList;

      return result.filter(
        (element) => new Date(element.timestamp * 1000) > user.lastBackupTime,
      );
    } catch (error) {
      throw new HttpException(
        'Error fetching data from third party GraphQL API',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async problemDetails(data: RecentAcSubmissionList[],user:UserResponseDto) {
    try {
      const requests = data.map((elt) => this.getDetails(elt.titleSlug));
      const responses = await Promise.all(requests);
      responses.map(async (details, idx) => {
        try {
          const element = data[idx];
          const problem = await this.databaseService.problem.create({
            data: {
              id: element.titleSlug,
              name: element.title,
              difficulty: details.difficulty.toUpperCase(),
              points: await this.getPoints(details.difficulty),
            },
          });
          details.topicTags.forEach(async(elt)=>{
            await this.topicService.createTopicProblem({topicId:elt.slug,problemId:problem.id})
          })
          const userProblem = await this.problemService.addUserProblem({
            id:problem.id,
            title:problem.name,
            titleSlug:problem.id,
            timeStamp:element.timeStamp
          },user)
        } catch (error) {
          console.log(error,data[idx]);
        }
      });
    } catch (e) {
      console.log(e);
    }
    return data;
  }

  private async getDetails(titleSlug: string) {
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
      const topics = (
        await firstValueFrom(
          this.httpService.post(url, {
            query: query,
            variables: variables,
          }),
        )
      ).data.data.question;

      // { data: { question: { difficulty: 'Medium', topicTags: [Array] } } }
      topics.topicTags.forEach(async (element) => {
        try {
          await this.topicService.create({ id: element.slug });
        } catch (error) {
          console.error(error)
        }
      });
      return topics;
    } catch (error) {
      return;
    }
  }

  async getPoints(difficulty: string) {
    return difficulty.toUpperCase() == 'EASY'
      ? DifficultyPoints.EASY
      : difficulty.toUpperCase() == 'MEDIUM'
        ? DifficultyPoints.MEDIUM
        : difficulty.toUpperCase() == 'HARD'
          ? DifficultyPoints.HARD
          : 0;
  }
}
