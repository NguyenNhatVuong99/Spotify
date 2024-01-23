import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { TrackService } from './track.service';
import { CreateTrackDto } from './dto/create-track.dto';
import { UpdateTrackDto } from './dto/update-track.dto';
import { Tracks } from '@prisma/client';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';
import { FilterType } from 'src/common/interface/filter-type.interface';

@Controller('tracks')
export class TrackController {
  constructor(private readonly trackService: TrackService) { }

  @Post()
  create(@Body() createTrackDto: CreateTrackDto) {
    return this.trackService.create(createTrackDto);
  }

  @Get()
  findAll(@Query() params: FilterType): Promise<PaginationResponseType<Tracks>> {
    return this.trackService.findAll(params)
  }


  @Get(':id')
  getById(@Param('id') id: string): Promise<Tracks> {
    console.log('get user by id', id);
    return this.trackService.getById(id)
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTrackDto: UpdateTrackDto) {
    return this.trackService.update(+id, updateTrackDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.trackService.remove(+id);
  }
}
