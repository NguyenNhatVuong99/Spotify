import { Users } from "@prisma/client"
import { IsEmail, IsNotEmpty, IsOptional, MinLength } from "class-validator"

export class CreateUserDto {
    @IsNotEmpty()
    full_name: string


    @IsNotEmpty()
    @IsEmail()
    email: string

    @IsNotEmpty()
    @MinLength(6)
    password: string
}
export class UpdateUserDto {
    full_name: string
    email: string
    @IsOptional()
    password: string

}
