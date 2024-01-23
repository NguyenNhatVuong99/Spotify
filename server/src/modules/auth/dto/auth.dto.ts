import { IsBoolean, IsEmail, IsNotEmpty, Length } from "class-validator"

export class RegisterDTO {
    @IsNotEmpty()
    @IsEmail()
    email: string
    @IsNotEmpty()
    @Length(6)
    password: string
    @IsNotEmpty()
    full_name: string
}
export class LoginDTO {
    @IsNotEmpty()
    @IsEmail()
    email: string
    @IsNotEmpty()
    password: string
}