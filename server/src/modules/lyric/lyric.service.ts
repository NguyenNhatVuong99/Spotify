import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateLyricDto } from './dto/create-lyric.dto';
import { UpdateLyricDto } from './dto/update-lyric.dto';
import { Lyrics } from '@prisma/client';
import { PrismaService } from 'prisma.service';

@Injectable()
export class LyricService {
    constructor(private primaService: PrismaService) { }
    // async getByTrackId(id: string): Promise<Lyrics> {
    //     const lyrics = await this.primaService.lyrics.findMany({
    //         where: {
    //             track_id: {
    //                 contains: id
    //             }
    //         },
    //         orderBy: {
    //             index: 'desc'
    //         }
    //     })
        
    //     return lyrics;
    // }

    update(id: number, updateLyricDto: UpdateLyricDto) {
        return `This action updates a #${id} lyric`;
    }

    remove(id: number) {
        return `This action removes a #${id} lyric`;
    }
}
