import { Injectable } from '@nestjs/common';
import { CreateArtistDto } from './dto/create-artist.dto';
import { UpdateArtistDto } from './dto/update-artist.dto';
import { Artists } from '@prisma/client';
import { PrismaService } from 'prisma.service';
import { FilterType } from 'src/common/interface/filter-type.interface';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';

@Injectable()
export class ArtistService {
	constructor(private primaService: PrismaService) { }

	create(createArtistDto: CreateArtistDto) {
		return 'This action adds a new artist';
	}
	async findAll(filters: FilterType): Promise<PaginationResponseType<Artists>> {

		const items_per_page = Number(filters.items_per_page) || 10
		const page = Number(filters.page) || 1
		const search = filters.search || ''
		const skip = page > 1 ? (page - 1) * items_per_page : 0
		const artists = await this.primaService.artists.findMany({
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
			}
		})
		const total = await this.primaService.users.count({
			where: {
				OR: [
					{
						full_name: {
							contains: search
						}
					},
					{
						email: {
							contains: search
						}
					}
				],
				AND: [
					{
						status: true,
					}
				]
			},
		})
		return {
			data: artists,
			total,
			current_page: page,
			items_per_page: items_per_page
		}
	}
	findOne(id: number) {
		return `This action returns a #${id} artist`;
	}

	update(id: number, updateArtistDto: UpdateArtistDto) {
		return `This action updates a #${id} artist`;
	}

	remove(id: number) {
		return `This action removes a #${id} artist`;
	}
}
