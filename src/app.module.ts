import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { AuthModule } from './auth/auth.module';
import { OfferingModule } from './offering/offering.module';

@Module({
  imports: [ConfigModule.forRoot(), AuthModule, OfferingModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
