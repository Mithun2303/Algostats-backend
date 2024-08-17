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
import { UserProblemResponseDto, UserRole } from './dto/user.dto';
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
  @AllowedRoles([UserRole.TUTOR, UserRole.STUDENT])
  @UseGuards(AuthGaurd)
  @Get('routine/:id')
  @AllowAllRoles
  @ApiOkResponse({
    description: 'Successfully generated backup for user',
  })
  @Get('problem/:id')
  async getUserProblems(
    @Param('id') id: string,
  ): Promise<UserProblemResponseDto[]> {
    return (await this.problemService.getUserProblems(id)).map(
      (elt) => new UserProblemResponseDto(elt),
    );
  }

}
