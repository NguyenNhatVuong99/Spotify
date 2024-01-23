import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ArtistService } from './artist.service';
import { CreateArtistDto } from './dto/create-artist.dto';
import { UpdateArtistDto } from './dto/update-artist.dto';
import { Artists } from '@prisma/client';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';
import { FilterType } from 'src/common/interface/filter-type.interface';

@Controller('artists')
export class ArtistController {
  constructor(private readonly artistService: ArtistService) { }

  @Post()
  create(@Body() createArtistDto: CreateArtistDto) {
    return this.artistService.create(createArtistDto);
  }

  @Get()
  findAll(@Query() params: FilterType): Promise<PaginationResponseType<Artists>> {
    return this.artistService.findAll(params)
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.artistService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateArtistDto: UpdateArtistDto) {
    return this.artistService.update(+id, updateArtistDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.artistService.remove(+id);
  }
}
