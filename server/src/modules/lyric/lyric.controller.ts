import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LyricService } from './lyric.service';
import { CreateLyricDto } from './dto/create-lyric.dto';
import { UpdateLyricDto } from './dto/update-lyric.dto';

@Controller('lyric')
export class LyricController {
  constructor(private readonly lyricService: LyricService) { }



  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.lyricService.getByTrackId(id);
  // }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateLyricDto: UpdateLyricDto) {
    return this.lyricService.update(+id, updateLyricDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.lyricService.remove(+id);
  }
}
