import { Body, Controller,Get,Post,Req,Res } from "@nestjs/common";
import {TaskService} from './task.service';
//import { GetUser } from "./user.decorator";
import { Task, Users } from "@prisma/client";
import { createTaskDto } from "./task.dto";


@Controller('task')
export class TaskController{
    constructor (private readonly taskService: TaskService){}
        @Post('newTask')
        async createTask(@Body()data:createTaskDto,){
            return 
        
        }
}