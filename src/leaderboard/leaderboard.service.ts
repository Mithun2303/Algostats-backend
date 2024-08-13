import { Injectable } from '@nestjs/common';
import { CreateLeaderboardDto } from './dto/create-leaderboard.dto';
import { UpdateLeaderboardDto } from './dto/update-leaderboard.dto';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class LeaderboardService {
  constructor(
    private readonly databaseService: DatabaseService,
  ) {}

  async findAll() {
    return `This action returns all leaderboard`;
  }

  async findClassLeaderboard(id: string) {
    return this.databaseService.users.findMany({
      where:{
        classId:id
      }
    })
  }

  async findStreamLeaderboard(id: String) {
    return `This action returns a #${id} leaderboard`;
  }

}
