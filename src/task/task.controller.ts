import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
} from '@nestjs/common';
import { TaskService } from './task.service';

import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { AuthGaurd } from 'src/auth/gaurd/auth.gaurd';
import AllowedRoles from 'src/user/decorator/allowedRoles.decorator';
import { UserRole } from 'src/user/dto/user.dto';
import { LoggedInUser } from 'src/user/decorator/loggedIn.decorator';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { TaskCreateDto } from './dto/task.dto';


@ApiTags("task")
@Controller('task')
export class TaskController {
  constructor(private readonly taskService: TaskService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGaurd)
  @AllowedRoles([UserRole.TUTOR, UserRole.PLACEMENT_REPRESENTATIVE])
  @Post()
  async createClassTask(
    @LoggedInUser() userDet: UserResponseDto,
    @Body() body: TaskCreateDto,
  ) {
    if (
      userDet.role == UserRole.TUTOR ||
      userDet.role == UserRole.PLACEMENT_REPRESENTATIVE
    ) {
      body.class=userDet.class;
      console.log(await this.taskService.createClassTask(userDet,body))
    }
    else if(userDet.role== UserRole.PLACEMENT_COORDINATOR){
      // CC to individual class
    }
    // PC to individual class
  }


  //PC,CC to stream

  //PC to batch
}
