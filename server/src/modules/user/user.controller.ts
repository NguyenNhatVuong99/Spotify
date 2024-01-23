import { Body, Controller, Delete, Get, Param, ParseIntPipe, Post, Put, Query } from '@nestjs/common';
import { Users } from '@prisma/client';
import { CreateUserDto, UpdateUserDto } from './dto/user.dto';
import { UserService } from './user.service';
import { FilterType } from 'src/common/interface/filter-type.interface';
import { PaginationResponseType } from 'src/common/interface/pagination-response-type.interface';

@Controller('users')
export class UserController {
    constructor(private userService: UserService) { }
    @Get()
    getAll(@Query() params: FilterType): Promise<PaginationResponseType<Users>> {
        console.log("get all user api", params)
        return this.userService.getAll(params)
    }
    @Get(':id')
    getById(@Param('id') id: string): Promise<Users> {
        console.log('get user by id', id);
        return this.userService.getById(id)
    }
    @Post()
    create(@Body() body: CreateUserDto): Promise<Users> {
        return this.userService.create(body);
    }
    @Put(':id')
    update(@Param('id') id: string, @Body() body: UpdateUserDto): Promise<Users> {
        return this.userService.update(id, body);
    }
    @Delete(':id')
    delete(@Param('id') id: string): Promise<Users> {
        return this.userService.delete(id);
    }
}
