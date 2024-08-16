import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { batchLeaderboardResponseDto, classLeaderboardResponseDto, LeaderboardResponseDto, streamLeaderboardResponseDto } from './dto/leaderboard.dto';

@Injectable()
export class LeaderboardService {
  constructor(private readonly databaseService:DatabaseService){}
  async findClassLeaderboard(id: string): Promise<classLeaderboardResponseDto[]> {
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

  async findStreamLeaderboard(id: string): Promise<streamLeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','batch'], 
        where: {
        AND: [
          { stream: id },
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
      const batch = elt.batch;
      return {id,score,batch}
      }))
  }

  async findBatchLeaderboard(id: number): Promise<batchLeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','stream'], 
        where: {
        AND: [
          { batch: id},
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
      const stream = elt.stream;
      return {id,score,stream}
      }))
  }

  async findLeaderboard(): Promise<LeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','batch','stream'], 
        where: {
        AND: [
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
      const batch = elt.batch;
      const stream = elt.stream;
      return {id,score,batch,stream}
      }))
  }
}

