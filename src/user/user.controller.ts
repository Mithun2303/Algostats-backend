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
  NotFoundException,
} from '@nestjs/common';
import { UserService } from './user.service';
import { Prisma } from '@prisma/client';
import { ApiBearerAuth, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { LeetcodeService } from './leetcode.service';
import AllowedRoles, {
  AllowAllRoles,
} from './decorator/allowedRoles.decorator';
import { UserRole } from './dto/user.dto';
import { AuthGaurd } from 'src/auth/gaurd/auth.gaurd';
import { ProblemService } from './problem.service';
import { LoggedInUser } from './decorator/loggedIn.decorator';
import { UserResponseDto } from 'src/auth/dto/auth.dto';

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(
    private readonly userService: UserService,
    private readonly leetcodeService: LeetcodeService,
    private readonly problemService: ProblemService,
  ) {}

  @ApiOkResponse({
    description: 'Successfully generated backup for user',
  })
  @ApiBearerAuth()
  @AllowedRoles([UserRole.TUTOR,UserRole.PLACEMENT_REPRESENTATIVE])
  @UseGuards(AuthGaurd)
  @Get('problem/:id')
  async scrape_problem(@Param('id') id: string) {
    const user = await this.userService.getOneById(id);
    if (!user) throw new NotFoundException('User does not exist');

    //API request to find recent problems
    const problem_list = await this.leetcodeService.listRecentProblem(user);

    //Update last backup time
    // await this.userService.updateBackupTime(id);

    // Service to find problems that is not in the db. Add user_problem relation if problem is in DB
    const excluded_problem = await this.problemService.findExcluded(
      problem_list,
      user,
    );

    //Get problem details for excluded problems
    const problemDetail =
      await this.leetcodeService.problemDetails(excluded_problem);

    await new Promise<void>((resolve) => {
      setTimeout(resolve, 3000);
    });

    //Add user problem details
    const userProblem = await this.problemService.addUserProblem(
      excluded_problem,
      user,
    );
  }
}
