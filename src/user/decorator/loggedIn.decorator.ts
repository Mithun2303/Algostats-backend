import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { Request } from 'express';

export const LoggedInUser = createParamDecorator(
  (field: string | undefined, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest<Request>();
    if (field) return request.user[field];
    return request.user;
  },
);
