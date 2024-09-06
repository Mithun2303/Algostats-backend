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
import { batchLeaderboardResponseDto, classLeaderboardResponseDto, LBparamResponseDto, LeaderboardResponseDto, streamLeaderboardResponseDto } from './dto/leaderboard.dto';

@ApiTags('leaderboard')
@Controller('leaderboard')
export class LeaderboardController {
  constructor(private readonly leaderboardService: LeaderboardService) {}

  @Post()
  async findOne(
    @Body() body:LBparamResponseDto) {
    return (await this.leaderboardService.findLeaderboard(body.from ,body.to)).map(
      (elt) => new LeaderboardResponseDto(elt),
    );
  }

  @Post('class/:id')
  async findClass(
    @Param('id') id: string,
    @Body() body:LBparamResponseDto) {
    console.log("hello")
    return (await this.leaderboardService.findClassLeaderboard(id.toUpperCase(),body.from ,body.to)).map(
      (elt) => new classLeaderboardResponseDto(elt),
    );
  }

  @Post('stream/:id')
  async findStream(
    @Param('id') id: string,
    @Body() body:LBparamResponseDto) {
    return (await this.leaderboardService.findStreamLeaderboard(id,body.from,body.to))
    .map(
      (elt) => new streamLeaderboardResponseDto(elt),
    );
  }

  @Post('batch/:id')
  async findBatch(
    @Param('id') id: string,
    @Body() body:LBparamResponseDto) {
    return (await this.leaderboardService.findBatchLeaderboard(+id,body.from,body.to))
    .map(
      (elt) => new batchLeaderboardResponseDto(elt),
    );
  }
}
