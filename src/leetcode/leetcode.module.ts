import { Module } from '@nestjs/common';
import { LeetcodeService } from './leetcode.service';
import { HttpModule } from '@nestjs/axios';

@Module({
  imports:[HttpModule],
  providers: [LeetcodeService],
  exports:[LeetcodeService]
})
export class LeetcodeModule {}
