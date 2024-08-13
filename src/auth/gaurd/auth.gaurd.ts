import {
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { AuthService } from '../auth.service';
import { Reflector } from '@nestjs/core';
import { UserService } from 'src/user/user.service';
import { Observable } from 'rxjs';
import AllowedRoles from 'src/user/decorator/allowedRoles.decorator';
import { Request } from 'express';
import { UserRole } from 'src/user/dto/user.dto';

@Injectable()
export class AuthGaurd implements CanActivate {
  constructor(
    private readonly authService: AuthService,
    private readonly reflector: Reflector,
    private readonly userService: UserService,
  ) {}
  async canActivate(context: ExecutionContext): Promise<boolean> {
    const allowedRoles =
      this.reflector.get(AllowedRoles, context.getHandler()) || [];
    console.log(allowedRoles);
    const request = context.switchToHttp().getRequest<Request>();
    const token = this.extractPayload(request);
    console.log(token)
    if (!token)
      throw new ForbiddenException('You are forbidden to access this endpoint');

    const { email } = await this.authService.verifyToken(token);
    request.user = await this.userService.getOne(email);
    // console.log(request.user);
    return allowedRoles.indexOf(request.user.role as UserRole) > -1;
  }
  private extractPayload(request: Request): string | undefined {
    const [type, token] = request.headers.authorization?.split(' ') ?? [];
    return type === 'Bearer' ? token : undefined;
  }
}
