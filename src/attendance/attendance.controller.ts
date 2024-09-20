import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { AttendanceService } from './attendance.service';
import { AuthGaurd } from 'src/auth/gaurd/auth.gaurd';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { LoggedInUser } from 'src/user/decorator/loggedIn.decorator';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import AllowedRoles from 'src/user/decorator/allowedRoles.decorator';
import { UserRole } from 'src/user/dto/user.dto';
import {  AttendanceDTO, AttendanceListDTO, UserAttendanceDTO } from './dto/attendance.dto';

@Controller('attendance')
@ApiTags("attendance")
export class AttendanceController {
  constructor(private readonly attendanceService: AttendanceService) {}

  // @Post()
  // create(@Body() createAttendanceDto: CreateAttendanceDto) {
  //   return this.attendanceService.create(createAttendanceDto);
  // }
  @UseGuards(AuthGaurd)
  @ApiBearerAuth()
  @Get("/classList")
  @AllowedRoles([UserRole.PLACEMENT_REPRESENTATIVE])
  async findAll(@LoggedInUser() user:UserResponseDto):Promise<AttendanceListDTO[]> {
    return (await this.attendanceService.findStudents(user)).map(elt=>new AttendanceListDTO(elt));
  }


  @UseGuards(AuthGaurd)
  @ApiBearerAuth()
  @Post()
  @AllowedRoles([UserRole.PLACEMENT_REPRESENTATIVE])
  async markAttendance(@LoggedInUser() user:UserResponseDto,@Body() body:AttendanceDTO){
      this.attendanceService.markPresent(user,body)
  }

  @Get('user/:id')
  async getAttendance(@Param('id') id:string):Promise<UserAttendanceDTO>{
    return new UserAttendanceDTO(await this.attendanceService.getUserAttendance(id));
  }
}
