import { Body, Controller, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { OfferingService } from './offering.service';

@Controller()
export class OfferingController {
  constructor(private readonly offeringService: OfferingService) {}

  @Post('offering')
  createOffering(@Body() createOfferingDTO: Prisma.OfferingCreateInput) {
    return this.offeringService.createOffering(createOfferingDTO);
  }
}
