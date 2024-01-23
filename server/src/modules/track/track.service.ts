import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateTrackDto } from './dto/create-track.dto';
import { UpdateTrackDto } from './dto/update-track.dto';
import { FilterType } from 'src/common/interface/filter-type.interface';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';
import { Tracks } from '@prisma/client';
import { PrismaService } from 'prisma.service';

@Injectable()
export class TrackService {
	constructor(private primaService: PrismaService) { }

	create(createTrackDto: CreateTrackDto) {
		return 'This action adds a new track';
	}

	async findAll(filters: FilterType): Promise<PaginationResponseType<Tracks>> {

		const items_per_page = Number(filters.items_per_page) || 10
		const page = Number(filters.page) || 1
		const search = filters.search || ''
		const skip = page > 1 ? (page - 1) * items_per_page : 0
		const tracks = await this.primaService.tracks.findMany({
			take: items_per_page,
			skip,
			where: {
				OR: [
					{
						name: {
							contains: search
						}
					},

				],
				AND: [
					{
						status: true,
					}
				]
			},
			orderBy: {
				created_at: 'desc'
			},
			include:
			{
				album: {
					include: {
						artist: true,
					},
				},
			},

		})
		const total = await this.primaService.tracks.count({
			where: {
				OR: [
					{
						name: {
							contains: search
						}
					},
				],
				AND: [
					{
						status: true,
					}
				]
			},
		})
		return {
			data: tracks,
			total,
			current_page: page,
			items_per_page: items_per_page
		}
	}

	async getById(id: string): Promise<Tracks> {
		const track = await this.primaService.tracks.findFirst({
			where: {
				id
			}
		})
		if (!track) {
			throw new HttpException('User not found', HttpStatus.NOT_FOUND)
		}
		return track
	}
	findOne(id: number) {
		return `This action returns a #${id} track`;
	}

	update(id: number, updateTrackDto: UpdateTrackDto) {
		return `This action updates a #${id} track`;
	}

	remove(id: number) {
		return `This action removes a #${id} track`;
	}
}
