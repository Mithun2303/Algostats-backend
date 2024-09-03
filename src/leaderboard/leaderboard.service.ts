import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { batchLeaderboardResponseDto, classLeaderboardResponseDto, LeaderboardResponseDto, streamLeaderboardResponseDto } from './dto/leaderboard.dto';

@Injectable()
export class LeaderboardService {
  constructor(private readonly databaseService:DatabaseService){}
  async findClassLeaderboard(id: string): Promise<classLeaderboardResponseDto[]> {
    return (await this.databaseService.leaderboard.groupBy({
      by:['userId','name'],
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
      const name = elt.name
      return {id,score,name}
      })
  }

  async findStreamLeaderboard(id: string): Promise<streamLeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','batch','name'], 
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
      const name = elt.name;
      return {id,score,batch,name}
      }))
  }

  async findBatchLeaderboard(id: number): Promise<batchLeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','stream','name'], 
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
      const name = elt.name;
      return {id,score,stream,name}
      }))
  }

  async findLeaderboard(): Promise<LeaderboardResponseDto[]> {
    return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','batch','stream','name','class'], 
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
      const name = elt.name;
      const idx = elt.class;
      return {id,score,batch,stream,name,class:idx}
      }))
  }
}

