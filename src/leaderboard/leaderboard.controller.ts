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
import { LeaderboardResponseDto } from './dto/leaderboard.dto';

@ApiTags('leaderboard')
@Controller('leaderboard')
export class LeaderboardController {
  constructor(private readonly leaderboardService: LeaderboardService) {}

  @Get('class/:id')
  async findOne(@Param('id') id: string) {
    return (await this.leaderboardService.findClassLeaderboard(id)).map(
      (elt) => new LeaderboardResponseDto(elt),
    );
  }
}
