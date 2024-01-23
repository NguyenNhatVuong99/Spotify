import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { PrismaService } from 'prisma.service';
import { hash, compare } from 'bcrypt';
import { Users } from '@prisma/client';
import { LoginDTO, RegisterDTO } from './dto/auth.dto';
import { JwtService } from '@nestjs/jwt';
import * as Redis from 'ioredis';

@Injectable()
export class AuthService {
    // private readonly redisClient: Redis.Redis; // Redis client instance
    // constructor(private primaService: PrismaService) {
    // }
    constructor(private primaService: PrismaService, private jwtService: JwtService) {
    //     this.redisClient = new Redis();
    }
    register = async (userData: RegisterDTO): Promise<Users> => {
        // check email exists
        const user = await this.primaService.users.findUnique({
            where: {
                email: userData.email
            }
        })
        if (user) {
            throw new HttpException({ message: 'Email already exists' }, HttpStatus.BAD_REQUEST)
        }
        const hashPassword = await hash(userData.password, 10)
        const res = await this.primaService.users.create({
            data: { ...userData, password: hashPassword }
        })
        return res
    }
    login = async (data: { email: string, password: string }): Promise<any> => {
        //step 1: checking user is exist by email
        const user = await this.primaService.users.findUnique({
            where: {
                email: data.email
            }
        })
        if (!user) {
            throw new HttpException({ message: 'Incorrect email or password' }, HttpStatus.UNAUTHORIZED)
        }
        //step 2: check password
        const verify = await compare(data.password, user.password)
        if (!verify) {
            throw new HttpException({ message: 'Incorrect email or password' }, HttpStatus.UNAUTHORIZED)
        }
        //step 3: generate access token and refresh token
        const payload = { id: user.id, name: user.full_name, email: user.email }
        const accessToken = await this.jwtService.signAsync(payload, {
            secret: process.env.ACCESS_TOKEN_KEY,
            expiresIn: '1h'
        })
        const refreshToken = await this.jwtService.signAsync(payload, {
            secret: process.env.REFRESH_TOKEN_KEY,
            expiresIn: '7d'
        })
        // await this.saveRefreshTokenToRedis(user.id, refreshToken)
        return {
            accessToken, refreshToken
        }
    }
    // async saveRefreshTokenToRedis(userId: string, refreshToken: string): Promise<void> {
    //     await this.redisClient.set(`refresh-token:${userId}`, refreshToken, 'EX', 7 * 24 * 60 * 60);
    // }

    // async removeRefreshTokenFromRedis(userId: string): Promise<void> {
    //     await this.redisClient.del(`refresh-token:${userId}`);
    // }
    // logout = async (token: string): Promise<void> => {
    //     return 
    // }
}


