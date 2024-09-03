import { Injectable } from '@nestjs/common';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { DatabaseService } from 'src/database/database.service';
import { TaskCreateDto, TaskCreateResponseDto } from './dto/task.dto';
import { UserRole } from 'src/user/dto/user.dto';
import { Prisma } from '@prisma/client';

@Injectable()
export class TaskService {
  constructor(private readonly databaseService: DatabaseService) {}

  async createTask(userDet: UserResponseDto, body: TaskCreateDto):Promise<TaskCreateResponseDto>{
    const task = await this.databaseService.task.create({
      data: {
        assignedById: userDet.id,
        count: body.count,
        deadline: body.deadline,
      },
    });
    console.log(task);
    const users = (
      await this.databaseService.user.findMany({
        where: {
          class: {
            not: null,
            equals: body.class,
          },
          role: UserRole.STUDENT,
        },
        select: {
          id: true,
        },
      })
    ).map((elt) => {
      const userId = elt.id;
      const taskId = task.id;
      return { userId, taskId };
    });
    console.log(users);
    const userTask = await this.databaseService.user_Task.createMany({
      data: users,
    });
    return new TaskCreateResponseDto(task);
  }


}
