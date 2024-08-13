import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { APP_GUARD } from '@nestjs/core';
import { AuthGaurd } from './gaurd/auth.gaurd';
@Module({
  controllers: [AuthController],
  providers: [AuthService,AuthGaurd,],
  exports:[AuthGaurd,AuthService]
})
export class AuthModule {}
