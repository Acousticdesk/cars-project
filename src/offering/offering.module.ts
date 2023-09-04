import { Module } from '@nestjs/common';
import { OfferingController } from './offering.controller';
import { OfferingService } from './offering.service';
import { PrismaService } from '../prisma.service';

@Module({
  imports: [],
  controllers: [OfferingController],
  providers: [OfferingService, PrismaService],
})
export class OfferingModule {}
