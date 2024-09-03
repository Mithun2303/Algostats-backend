import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  ForbiddenException,
} from '@nestjs/common';
import { TaskService } from './task.service';

import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { AuthGaurd } from 'src/auth/gaurd/auth.gaurd';
import AllowedRoles from 'src/user/decorator/allowedRoles.decorator';
import { UserRole } from 'src/user/dto/user.dto';
import { LoggedInUser } from 'src/user/decorator/loggedIn.decorator';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { TaskCreateDto, TaskCreateResponseDto } from './dto/task.dto';

@ApiTags('task')
@Controller('task')
export class TaskController {
  constructor(private readonly taskService: TaskService) {}
  @ApiBearerAuth()
  @UseGuards(AuthGaurd)
  @AllowedRoles([
    UserRole.TUTOR,
    UserRole.PLACEMENT_REPRESENTATIVE,
    UserRole.PLACEMENT_COORDINATOR,
    UserRole.COURSE_COORDINATOR,
  ])
  @Post()
  async createTask(
    @LoggedInUser() userDet: UserResponseDto,
    @Body() body: TaskCreateDto,
  ): Promise<TaskCreateResponseDto> {
    if (
      userDet.role == UserRole.TUTOR ||
      userDet.role == UserRole.PLACEMENT_REPRESENTATIVE
    ) {
      if (body.class == userDet.class) {
        return this.taskService.createTask(userDet, body);
      }
      else{
        throw new ForbiddenException(
          'You are not authorized to assign task to this class ',
        );
      }
    }
    return this.taskService.createTask(userDet, body);
  }

  //PC,CC to stream

  //PC to batch
}
