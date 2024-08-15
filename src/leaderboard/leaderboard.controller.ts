import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LeaderboardService } from './leaderboard.service';
import { LeaderboardResponseDto } from './dto/leaderboard.dto';
import { ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { AllowAllRoles } from 'src/user/decorator/allowedRoles.decorator';
import { ProblemService } from 'src/user/problem.service';


@ApiTags('leaderboard')
@Controller('leaderboard')
export class LeaderboardController {
  constructor(private readonly leaderboardService: LeaderboardService) {}

  @AllowAllRoles
  @ApiOkResponse({
    description: 'Successfully generated backup for user',
  })

  @Get()
  async findLeaderboard() {
    return this.leaderboardService.findLeaderboard();
  }

  @Get('class/:id')
  async findClassLeaderboard(@Param('id') id: string):Promise<LeaderboardResponseDto[]> {
    return ((await this.leaderboardService.findClassLeaderboard(id)).map(
      (elt,et) => new LeaderboardResponseDto(elt,et)
    )
    );
  }

  // @Get('class/:id')
  // async findClassLeaderboard(@Param('id') id: string) {
  //   return this.leaderboardService.findClassLeaderboard(id);
  // }

  @Get('stream/:id')
  async findStreamLeaderboard(@Param('id') id: string) {
    return this.leaderboardService.findStreamLeaderboard(id);
  }

  @Get('batch/:id')
  async findBatchLeaderboard(@Param('id') id: string) {
    return this.leaderboardService.findBatchLeaderboard(+id);
  }
}
