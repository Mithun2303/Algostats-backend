import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { UserResponseDto } from 'src/auth/dto/auth.dto';
import { AttendanceDTO } from './dto/attendance.dto';
import { v4 } from 'uuid';
@Injectable()
export class AttendanceService {
  constructor(private readonly databaseService: DatabaseService) {}
  // create(createAttendanceDto: CreateAttendanceDto) {
  //   return 'This action adds a new attendance';
  // }
  async findStudents(obj: UserResponseDto) {
    return this.databaseService.user.findMany({
      where: {
        class: obj?.class,
      },
      select: {
        id: true,
        name: true,
      },
      orderBy: {
        id: 'asc',
      },
    });
  }

  async markPresent(user: UserResponseDto, body: AttendanceDTO) {
    const classDet = await this.databaseService.placement_Class.create({
      data: {
        id: v4(),
        date: new Date(),
        classId: user.class,
        description: body.description,
        created_by: user.id,
      },
    });
    const classList = (
      await this.databaseService.user.findMany({
        where: {
          class: user.class,
        },
      })
    ).map((elt) => {
      return { userId: elt.id, classId: classDet.id };
    });
    console.log(classList);
    const users = !body.allPresent
      ? classList.map((elt) => {
          return body?.id?.find((el1) => el1 == elt.userId)
            ? { ...elt, present: body.present }
            : { ...elt, present: !body.present };
        })
      : classList.map((elt) => {
          return { ...elt, present: body.present };
        });
    console.log(users);

    await this.databaseService.attendance.createMany({
      data: users,
      skipDuplicates: true,
    });
    return true;
  }

  async getUserAttendance(id: string) {
    const response = (
      await this.databaseService.attendance.findMany({
        where: {
          userId: id,
        },
        select: {
          present: true,
        },
      })
    );
    let present = response.filter(elt=>elt.present==true).length;
    let total = response.length;
    console.log(present,total);
    return {present,total}
  }
}
