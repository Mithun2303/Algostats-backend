import { NestFactory, Reflector, HttpAdapterHost } from '@nestjs/core';
import { AppModule } from './app.module';
import { PrismaClientExceptionFilter } from 'nestjs-prisma';
import { SwaggerTheme, SwaggerThemeNameEnum } from 'swagger-themes';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AllExceptionsFilter } from './allException.filter';
import { ClassSerializerInterceptor, ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const { httpAdapter } = app.get(HttpAdapterHost);
  app.useGlobalFilters(new AllExceptionsFilter(httpAdapter));
  app.useGlobalFilters(new PrismaClientExceptionFilter(httpAdapter));

  app.setGlobalPrefix('/api');
  app.enableCors()
  app.useGlobalInterceptors(
    new ClassSerializerInterceptor(app.get(Reflector), {
      strategy: 'excludeAll',
      excludeExtraneousValues: true,
    }),
  );
  const swaggerTheme = new SwaggerTheme();
  const swaggerConfig = new DocumentBuilder()
    .setTitle('ALGOSTATS')
    .setDescription('API Description for ALGOSTATS')
    .setVersion('1.0.0')
    .addTag('auth', 'Authentication Routes')
    .addTag('user', 'User Managemenst Routes')
    .addTag('task', 'Task Management Routes')
    .addTag("leaderboard", "Leaderboard Management Routes")
    .addTag("attendance", "Attendance Management Routes")
    .addTag('default')
    .addTag('public', 'Public Routes')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, swaggerConfig);
  SwaggerModule.setup('swagger', app, document, {
    customCss: swaggerTheme.getBuffer(SwaggerThemeNameEnum.DARK),
  });

  await app.listen(3000);
}
bootstrap();
