import { Module } from '@nestjs/common';
import Leetcode from './client.service';
import { HttpModule } from '@nestjs/axios';

@Module({
  imports:[HttpModule],
  providers: [Leetcode],
  exports: [Leetcode]
})
export class ClientModule {}
