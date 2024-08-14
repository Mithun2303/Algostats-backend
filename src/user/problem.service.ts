import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/user/leetcode.service';
import { TopicService } from 'src/topic/topic.service';
import { RecentAcSubmissionList } from './dto/leetcode.dto';
import { UserResponseDto } from 'src/auth/dto/auth.dto';

@Injectable()
export class ProblemService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly leetcodeService: LeetcodeService,
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
      (element) => element.titleSlug == problems.find((ele) => ele == element.titleSlug),
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

  async addUserProblem(
    excluded_problem: RecentAcSubmissionList[],
    user: UserResponseDto,
  ) {
    excluded_problem.forEach(async (element) => {
      try {

          console.log(await this.databaseService.user_Problem.create({
            data: {
              timestamp: element.timeStamp,
              problemId: element.titleSlug,
              userId: user.id,
            },
          }))
        
      } catch (error) {
        console.log(error)
      }
    });
  }
}
