import {
  Body,
  Controller,
  Post,
  Get,
  Query,
  ParseIntPipe,
} from '@nestjs/common';
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
  getOfferings(
    @Query('page', ParseIntPipe) page = 1,
    @Query('perPage', ParseIntPipe) perPage = 10,
  ) {
    return this.offeringService.offeringsPaginated({
      page,
      perPage,
      orderBy: { createdAt: 'desc' },
    });
  }
}
