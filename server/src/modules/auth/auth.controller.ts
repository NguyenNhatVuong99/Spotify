import { Body, Controller, Get, HttpStatus, Post, Req } from '@nestjs/common';
import { Users } from '@prisma/client';
import { AuthService } from './auth.service';
import { LoginDTO, RegisterDTO } from './dto/auth.dto';

@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService) { }
    @Post('register')
    register(@Body() body: RegisterDTO): Promise<Users> {
        return this.authService.register(body)
    }
    @Post('login')
    login(@Body() body: LoginDTO): Promise<Users> {
        return this.authService.login(body)
    }
    @Get('logout')
    logout(@Req() req: Request) {

    }
    // @Post('logout')
    // logout(@Body() body: LoginDTO): Promise<User> {
    //     return this.authService.logout(body)
    // }


}
