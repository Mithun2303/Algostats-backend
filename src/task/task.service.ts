import { Injectable } from '@nestjs/common';
import { PrismaClient, Task } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';
import { createTaskDto } from './task.dto';

@Injectable()
export class TaskService {

    constructor(private readonly prisma:DatabaseService){
        
    }

    async createTask(data:createTaskDto){
        this.prisma.task.create({data:data})
    }
}
