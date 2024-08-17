import { Module } from '@nestjs/common';
import { TaskService } from './task.service';
import { TaskController } from './task.controller';
import { AuthModule } from 'src/auth/auth.module';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  imports:[AuthModule,DatabaseModule],
  controllers: [TaskController],
  providers: [TaskService],
})
export class TaskModule {}
