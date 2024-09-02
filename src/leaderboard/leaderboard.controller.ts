import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { LeaderboardService } from './leaderboard.service';
import { ApiTags } from '@nestjs/swagger';
import { batchLeaderboardResponseDto, classLeaderboardResponseDto, LeaderboardResponseDto, streamLeaderboardResponseDto } from './dto/leaderboard.dto';

@ApiTags('leaderboard')
@Controller('leaderboard')
export class LeaderboardController {
  constructor(private readonly leaderboardService: LeaderboardService) {}

  @Get()
  async findOne() {
    return (await this.leaderboardService.findLeaderboard()).map(
      (elt) => new LeaderboardResponseDto(elt),
    );
  }

  @Get('class/:id')
  async findClass(@Param('id') id: string) {
    console.log("hello")
    return (await this.leaderboardService.findClassLeaderboard(id)).map(
      (elt) => new classLeaderboardResponseDto(elt),
    );
  }

  @Get('stream/:id')
  async findStream(@Param('id') id: string) {
    return (await this.leaderboardService.findStreamLeaderboard(id))
    .map(
      (elt) => new streamLeaderboardResponseDto(elt),
    );
  }

  @Get('batch/:id')
  async findBatch(@Param('id') id: string) {
    return (await this.leaderboardService.findBatchLeaderboard(+id))
    .map(
      (elt) => new batchLeaderboardResponseDto(elt),
    );
  }
}
