import { Injectable } from '@nestjs/common';
import { Prisma, PrismaClient } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common'
import { RecentAcSubmissionList } from './dto/leetcode.dto';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { UserProblemResponseDto } from './dto/user.dto';
import { TopicService } from './topic.service';

@Injectable()
export class ProblemService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly topicService: TopicService,
  ) {}
  async findExcluded(
    data: RecentAcSubmissionList[],
    user: UserResponseDto,
  ): Promise<RecentAcSubmissionList[]> {
    const id = data.map((element) => element.titleSlug);
    const problems = (
      await this.databaseService.problem.findMany({
        where: {
          id: {
            in: id,
          },
        },
        select: {
          id: true,
        },
      })
    ).map((element) => element.id);

    const includedProblem = data.filter(
      (element) =>
        element.titleSlug == problems.find((ele) => ele == element.titleSlug),
    );
    includedProblem.forEach(async (element) => {
      try {
        await this.databaseService.user_Problem.create({
          data: {
            timestamp: element.timeStamp,
            userId: user.id,
            problemId: element.titleSlug,
          },
        });
      } catch (error) {}
    });

    const excludedProblem = data.filter(
      (element) => !problems.find((ele) => ele == element.titleSlug),
    );
    return excludedProblem;
  }

  async getUserProblems(id: string): Promise<UserProblemResponseDto[]> {
    return (
      await this.databaseService.user_Problem.findMany({
        where: {
          userId: id,
        },
        select: {
          problem: {
            select: {
              name: true,
              difficulty: true,
            },
          },
        },
      })
    ).map((element) => element.problem);
  }

  async addUserProblem(element: RecentAcSubmissionList, user: UserResponseDto) {
    console.log(
      await this.databaseService.user_Problem.create({
        data: {
          timestamp: element.timeStamp,
          problemId: element.titleSlug,
          userId: user.id,
        },
      }),
    );
  }
}
