import { Injectable } from '@nestjs/common';
import { CreateAlbumDto } from './dto/create-album.dto';
import { UpdateAlbumDto } from './dto/update-album.dto';
import { FilterType } from 'src/common/interface/filter-type.interface';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';
import { Albums } from '@prisma/client';
import { PrismaService } from 'prisma.service';

@Injectable()
export class AlbumService {
	constructor(private primaService: PrismaService) { }
	create(createAlbumDto: CreateAlbumDto) {
		return 'This action adds a new album';
	}

	async findAll(filters: FilterType): Promise<PaginationResponseType<Albums>> {

		const items_per_page = Number(filters.items_per_page) || 10
		const page = Number(filters.page) || 1
		const search = filters.search || ''
		const skip = page > 1 ? (page - 1) * items_per_page : 0


		const albums = await this.primaService.albums.findMany({
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
			include: {
				artist: true,
			},

		})
		const total = await this.primaService.albums.count({
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
			data: albums,
			total,
			current_page: page,
			items_per_page: items_per_page
		}
	}


	findOne(id: number) {
		return `This action returns a #${id} album`;
	}

	update(id: number, updateAlbumDto: UpdateAlbumDto) {
		return `This action updates a #${id} album`;
	}

	remove(id: number) {
		return `This action removes a #${id} album`;
	}
}
