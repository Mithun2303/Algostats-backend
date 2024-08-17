import { Injectable, NotFoundException } from '@nestjs/common';
import { UserService } from './user/user.service';
import { LeetcodeService } from './user/leetcode.service';
import { ProblemService } from './user/problem.service';
import { Cron, CronExpression } from '@nestjs/schedule';

@Injectable()
export class AppService {
  constructor(
    // private readonly userService:UserService,
    // private readonly leetcodeService:LeetcodeService,
    // private readonly problemService:ProblemService,
    
  ){}
  getHello(): string {
    return 'Hello World!';
  }

  // @Cron(CronExpression.EVERY_10_SECONDS)
  rundev(){
    console.log("hello");
  }
  // async scrape_problem() {
  //   const id = '22PC19'
  //   const user = await this.userService.getOneById(id);
  //   if (!user) throw new NotFoundException('User does not exist');

  //   //API request to find recent problems
  //   const problem_list = await this.leetcodeService.listRecentProblem(user);
  //   console.log(problem_list.length);
  //   //Update last backup time
  //   // await this.userService.updateBackupTime(id);

  //   // Service to find problems that is not in the db. Add user_problem relation if problem is in DB
  //   const excluded_problem = await this.problemService.findExcluded(
  //     problem_list,
  //     user,
  //   );

  //   //Get problem details for excluded problems
  //   const problemDetail = await this.leetcodeService.problemDetails(
  //     excluded_problem,
  //     user,
  //   );

  //   // await new Promise<void>((resolve) => {
  //   //   setTimeout(resolve, 3000);
  //   // });

  //   // //Add user problem details
  //   // const userProblem = await this.problemService.addUserProblem(
  //   //   excluded_problem,
  //   //   user,
  //   // );
  // }
}
