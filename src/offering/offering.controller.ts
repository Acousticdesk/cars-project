import { Body, Controller, Post, Get } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { OfferingService } from './offering.service';

@Controller()
export class OfferingController {
  constructor(private readonly offeringService: OfferingService) {}

  @Post('offerings')
  createOffering(@Body() createOfferingDTO: Prisma.OfferingCreateInput) {
    return this.offeringService.createOffering(createOfferingDTO);
  }

  @Get('offerings')
  getOfferings() {
    return this.offeringService.offerings({});
  }
}
