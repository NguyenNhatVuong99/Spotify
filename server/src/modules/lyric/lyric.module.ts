import { Module } from '@nestjs/common';
import { LyricService } from './lyric.service';
import { LyricController } from './lyric.controller';
import { PrismaService } from 'prisma.service';

@Module({
  controllers: [LyricController],
  providers: [LyricService, PrismaService],
})
export class LyricModule { }
