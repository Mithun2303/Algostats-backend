import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ParseIntPipe,
  UseGuards,
} from '@nestjs/common';
import { UserService } from './user.service';
import { Prisma } from '@prisma/client';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { LeetcodeService } from './leetcode.service';
import AllowedRoles, { AllowAllRoles } from './decorator/allowedRoles.decorator';
import { UserRole } from './dto/user.dto';
import { AuthGaurd } from 'src/auth/gaurd/auth.gaurd';
import { ProblemService } from './problem.service';

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(
    private readonly userSchemaService: UserService,
    private readonly leetcodeService: LeetcodeService,
    private readonly problemService:ProblemService
  ) {}
  
  @ApiBearerAuth()
  @AllowAllRoles
  // @AllowedRoles([UserRole.TUTOR])
  @UseGuards(AuthGaurd)
  @Get('problem/:id')
  async scrape_problem(@Param('id') id: string) {
    console.log(id);
    const user = await this.userSchemaService.getOne(id);
    const problem_list = await this.leetcodeService.listRecentProblem(user.leetcode);
    const excluded_problem = await this.problemService.findExcluded(problem_list);
    // problem_list.forEach(async (problem) => {
    //   const val = await this.databaseService.problem.findFirst({
    //     where: {
    //       id: problem.id,
    //     },
    //   });

    return;
  }
}
