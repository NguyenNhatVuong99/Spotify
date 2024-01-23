import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api');
  app.enableCors();
  await app.listen(3001);
  // console.log(__dirname, '..', 'public');
  console.log('server listening on http://localhost:3001')
}
bootstrap();
