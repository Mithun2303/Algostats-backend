import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LeaderboardService } from './leaderboard.service';
import { CreateLeaderboardDto } from './dto/create-leaderboard.dto';
import { UpdateLeaderboardDto } from './dto/update-leaderboard.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags("leaderboard")
@Controller('leaderboard')
export class LeaderboardController {
  constructor(private readonly leaderboardService: LeaderboardService) {}

  @Get()
  findAll() {
    return this.leaderboardService.findAll();
  }

  @Get('class/:id')
  findClassLeaderboard(@Param('id') id: string) {
    return this.leaderboardService.findClassLeaderboard(id);
  }

  @Get('stream/:id')
  findStreamLeaderboard(@Param('id') id: string) {
    return this.leaderboardService.findStreamLeaderboard(id);
  }

}
