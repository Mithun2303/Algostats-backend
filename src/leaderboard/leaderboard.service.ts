import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { LeaderboardResponseDto } from './dto/leaderboard.dto';

@Injectable()
export class LeaderboardService {
  constructor(private readonly databaseService:DatabaseService){}
  async findClassLeaderboard(id: string): Promise<LeaderboardResponseDto[]> {
    return (await this.databaseService.leaderboard.groupBy({
      by: ['userId'],
      where: {
        AND: [
          { class: id },
          // { timestamp: { gt: new Date() } },
          // { timestamp: { lt: new Date() } },
        ],
      },
      _sum: {
        points: true,
      },
      orderBy: {
        _sum: {
          points: 'desc',
        },
      },
    })).map((elt) => {
      const id = elt.userId;
      const score = elt._sum.points
      return {id,score}
      })
  }
}
