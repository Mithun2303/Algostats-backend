import { Reflector } from '@nestjs/core';
import { UserRole } from '../dto/user.dto';

const AllowedRoles = Reflector.createDecorator<UserRole[]>();

export const AllowAllRoles = AllowedRoles([
  UserRole.STUDENT,
  UserRole.PLACEMENT_REPRESENTATIVE,
  UserRole.TUTOR,
  UserRole.COURSE_COORDINATOR,
  UserRole.PLACEMENT_COORDINATOR,
]);

export default AllowedRoles;
