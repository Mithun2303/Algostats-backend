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
import { UserProblemDto, UserProblemResponseDto, UserRole } from './dto/user.dto';
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

  @Post('problem/:limit')
  async getUserProblems(
    @Param('limit',ParseIntPipe) limit: number,
    @Body() body:UserProblemDto
  ): Promise<UserProblemResponseDto[]> {
    return (await this.problemService.getUserProblems(body.id,limit)).map(
      (elt) => new UserProblemResponseDto(elt),
    );
  }
  // @ApiBearerAuth()
  @AllowAllRoles
  // @UseGuards(AuthGaurd)
  @Get(':userId')
  async getMe(@Param("userId") userId : string){
    return new UserResponseDto(await this.userService.getOneById(userId.toUpperCase()))
  }
}
