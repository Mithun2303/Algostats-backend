import { Injectable, NotFoundException } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { HttpException, HttpStatus } from '@nestjs/common';
import { firstValueFrom } from 'rxjs';
import { LeetcodeService } from 'src/user/leetcode.service';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { TopicService } from './topic.service';
import { ProblemService } from './problem.service';
import { Cron, CronExpression } from '@nestjs/schedule';

@Injectable()
export class UserService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly leetcodeService: LeetcodeService,
    private readonly problemService: ProblemService,
  ) {}

  async getOne(email: string): Promise<UserResponseDto> {
    return await this.databaseService.user.findUnique({
      where: {
        email,
      },
    });
  }

  async getOneById(id: string): Promise<UserResponseDto> {
    return await this.databaseService.user.findUnique({
      where: {
        id,
      },
    });
  }

  async updateBackupTime(id: string) {
    return this.databaseService.user.update({
      where: {
        id,
      },
      data: {
        lastBackupTime: new Date(),
      },
    });
  }

  //@Cron(CronExpression.EVERY_10_SECONDS)
  async runRoutine() {
    const users = (
      await this.databaseService.user.findMany({
        where:{
          leetcode:{
            not:null
          }
        },
        select: {
          id: true,
        },
      })
    ).map((elt) => elt.id);

    const user_response = users.map(async (elt) => {
      await this.scrape_problem(elt);
    });

    const promises = await Promise.all(user_response);
    console.log("Backup Generated")
  }


  async scrape_problem(id: string) {
    const user = await this.getOneById(id);
    if (!user) throw new NotFoundException('User does not exist');

    //API request to find recent problems
    const problem_list = await this.leetcodeService.listRecentProblem(user);
    console.log(problem_list);
    
    //Update last backup time
    await this.updateBackupTime(id);

    // Service to find problems that is not in the db. Add user_problem relation if problem is in DB
    const excluded_problem = await this.problemService.findExcluded(
      problem_list,
      user,
    );

    //Get problem details for excluded problems
    const problemDetail = await this.leetcodeService.problemDetails(
      excluded_problem,
      user,
    );
  }
}
