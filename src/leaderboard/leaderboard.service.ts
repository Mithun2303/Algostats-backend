import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { batchLeaderboardResponseDto, classLeaderboardResponseDto, LeaderboardResponseDto, streamLeaderboardResponseDto } from './dto/leaderboard.dto';

@Injectable()
export class LeaderboardService {
  constructor(private readonly databaseService:DatabaseService){}
  async findClassLeaderboard(id: string, from:Date , to:Date): Promise<classLeaderboardResponseDto[]> {
    if(from!=null && to!=null){
      return (await this.databaseService.leaderboard.groupBy({
        by: ['userId','name'], 
          where: {
          AND: [
            { class: id },
            { timestamp: { gt: from }},
            { timestamp: { lt: to } },
          ],
        },
        _sum: {
          points: true,
        },
        orderBy: {
          _sum: {
            points: 'desc',
          },
        }})).map((elt) => {
        const id = elt.userId;
        const score = elt._sum.points
        const name = elt.name
        return {id,score,name}
        })
    }
    else{
      return (await this.databaseService.leaderboard.groupBy({
        by: ['userId','name'], 
          where: {
          AND: [
            { class: id },
          ],
        },
        _sum: {
          points: true,
        },
        orderBy: {
          _sum: {
            points: 'desc',
          },
        }})).map((elt) => {
        const id = elt.userId;
        const score = elt._sum.points
        const name = elt.name
        return {id,score,name}
        })
    }
  }

  async findStreamLeaderboard(id: string, from:Date,to:Date): Promise<streamLeaderboardResponseDto[]> {
    if(from!=null && to!=null){
      return ((await this.databaseService.leaderboard.groupBy({
        by: ['userId','batch','name'], 
        where: {
        AND: [
          { stream: id },
          { timestamp: { gt: from } },
          { timestamp: { lt: to }}
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
    else{
      return ((await this.databaseService.leaderboard.groupBy({
        by: ['userId','batch','name'], 
        where: {
        AND: [
          { stream: id },
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
    }

  async findBatchLeaderboard(id: number,from:Date,to:Date): Promise<batchLeaderboardResponseDto[]> {
    if (from!=null && to!=null){
      return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','stream','name'], 
        where: {
        AND: [
          { batch: id},
          { timestamp: { gt: from } },
          { timestamp: { lt: to } },
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
      }))}
    else{
      return ((await this.databaseService.leaderboard.groupBy({
        by: ['userId','stream','name'], 
          where: {
          AND: [
            { batch: id},
            //{ timestamp: { gt: from } },
            //{ timestamp: { lt: to } },
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
  }

  async findLeaderboard(from:Date,to:Date): Promise<LeaderboardResponseDto[]> {
    if(from!=null && to!=null)
    {
      return ((await this.databaseService.leaderboard.groupBy({
      by: ['userId','batch','stream','name','class'], 
        where: {
        AND: [
          { timestamp: { gt: from } },
          { timestamp: { lt: to } },
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
    else{
      return ((await this.databaseService.leaderboard.groupBy({
        by: ['userId','batch','stream','name','class'], 
          where: {
          AND: [
            //{ timestamp: { gt: from } },
            //{ timestamp: { lt: to } },
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

}