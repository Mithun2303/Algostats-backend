import { Controller, Get,Req,Res } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get("/mine")
  getHello(@Req() request: Request,@Res() res:Response): string {
    console.log(request);

    return this.appService.getHello();
  }
}
