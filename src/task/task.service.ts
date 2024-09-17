import { Injectable } from '@nestjs/common';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { DatabaseService } from 'src/database/database.service';
import { TaskCreateDto, TaskCreateResponseDto } from './dto/task.dto';
import { UserRole } from 'src/user/dto/user.dto';
import { Prisma } from '@prisma/client';
import { Task } from './entities/task.entity';

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

  async generateReport(id:string){
    const task = await this.databaseService.task.findUnique({
      where: { id },
      select: {
        created_at: true,
        deadline: true
      }
    });
    
    const z = await this.databaseService.task.findMany({
      where:{id},
      include:{
        User_Task:{
          include:{
            user:{
              select:{
                id:true,
                name:true,
                class:true,
                solves:{
                  where:{
                    AND: [
                      { timestamp: { gt: task.deadline }},
                      { timestamp: { lt: task.created_at } },
                    ],
                  }
                },
              },
            }
          }
        }
      }
    })
    const name = z[0].User_Task.map(ele => ele.user).map(elt => (elt.name))
    //const sample = z[0].User_Task.map(ele => ele.user).map(elt => elt.solves)
    //console.log(z);
    //console.log(sample);
    console.log(this.formatReport(z[0].id, 
                                  z[0].count , 
                                  z[0].assignedById , 
                                  z[0].deadline , 
                                  z[0].created_at , 
                                  z[0].User_Task[0].user.class,
                                  name
                                  ))
  }

  async formatReport(id,count,assignedById,deadline,created,classid ,name){
    const namelist = name.map( name => `| ${name.padEnd(25)} |`).join('\n');
    console.log (` 
# ${id}
Assigned by: ${assignedById}
Assigned to: ${classid}
Date Assigned: ${created}
Deadline:  ${deadline}
Total problems: ${count}

|Student name | Completed Problems|
|----------|---------------|
${namelist}
    `);
  }
}
