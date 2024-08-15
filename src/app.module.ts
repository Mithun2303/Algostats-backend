import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    DatabaseModule,
    UserModule,
    AuthModule,
    JwtModule.registerAsync({
      global: true,
      useFactory: async () => ({
        secret: "DADDY'S HOME",
        signOptions: {
          issuer: 'http://localhost:3000/',
          expiresIn: '1d',
        },
        verifyOptions: {
          issuer: 'http://localhost:3000/',
          ignoreExpiration: false,
        },
      }),
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
