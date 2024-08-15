import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { LeaderboardResponseDto } from './dto/leaderboard.dto';

@Injectable()
export class LeaderboardService {
  constructor(
    private readonly databaseService: DatabaseService,
  ){}
  async findLeaderboard() {
    return `This action returns all leaderboard`;
  }

  async findClassLeaderboard(id: string) {
    return (await this.databaseService.leaderboard.groupBy({
      by: ['userId'],
      where: {
        AND: [
          { class: id },
          { timestamp: { gt: new Date() } },
          { timestamp: { lt: new Date() } },
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
    })).map((elt) => elt.userId , (et => et._sum.points))
  }
async findStreamLeaderboard(id: string) {
  return `This action returns a #${id} leaderboard`;
}

async findBatchLeaderboard(id: number) {
  return `This action returns a #${id} leaderboard`;
}
};


