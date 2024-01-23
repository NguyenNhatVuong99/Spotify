import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { Users } from '@prisma/client';
import { PrismaService } from 'prisma.service';
import { hash } from 'bcrypt'
import { FilterType } from 'src/common/interface/filter-type.interface';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';
import { CreateUserDto, UpdateUserDto } from './dto/user.dto';
@Injectable()
export class UserService {
    constructor(private primaService: PrismaService) { }
    async getAll(filters: FilterType): Promise<PaginationResponseType<Users>> {
        const items_per_page = Number(filters.items_per_page) || 10
        const page = Number(filters.page) || 1
        const search = filters.search || ''
        const skip = page > 1 ? (page - 1) * items_per_page : 0
        const users = await this.primaService.users.findMany({
            take: items_per_page,
            skip,
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
            data: users,
            total,
            current_page: page,
            items_per_page: items_per_page
        }
    }
    async getById(id: string): Promise<Users> {
        const user = await this.primaService.users.findFirst({
            where: {
                id
            }
        })
        if (!user) {
            throw new HttpException('User not found', HttpStatus.NOT_FOUND)
        }
        return user
    }
    async create(body: CreateUserDto): Promise<Users> {
        const user = await this.primaService.users.findUnique({
            where: {
                email: body.email,
            },
        })
        if (user) {
            throw new HttpException('User already exists', HttpStatus.BAD_REQUEST)
        }
        const hashPassword = await hash(body.password, 10)
        const result = await this.primaService.users.create({
            data: { ...body, password: hashPassword }
        })
        return result

    }
    async update(id: string, body: UpdateUserDto): Promise<Users> {
        return await this.primaService.users.update({
            where: {
                id
            },
            data: body
        })
    }
    async delete(id: string): Promise<Users> {
        const user = await this.primaService.users.findFirst({
            where: {
                id
            }
        })
        if (!user) {
            throw new HttpException('User not found', HttpStatus.NOT_FOUND)
        }
        return await this.primaService.users.delete({
            where: {
                id
            }
        })
    }
}
