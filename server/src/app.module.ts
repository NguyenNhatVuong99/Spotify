import { CacheInterceptor, CacheModule } from '@nestjs/cache-manager';

import { APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { Module, ValidationPipe } from '@nestjs/common';
import { redisStore } from 'cache-manager-redis-yet';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { ArtistModule } from './modules/artist/artist.module';
import { AlbumModule } from './modules/album/album.module';
import { TrackModule } from './modules/track/track.module';
import { LyricModule } from './modules/lyric/lyric.module';

@Module({
	imports: [
		CacheModule.register({
			ttl: 60000,
			store: redisStore,
			url: process.env.REDIS_URL
		}),
		AuthModule, UserModule, ArtistModule, AlbumModule, TrackModule, LyricModule
	],
	controllers: [AppController],
	providers: [AppService,
		{
			provide: APP_PIPE,
			useClass: ValidationPipe,
		}
	],
})
export class AppModule { }
