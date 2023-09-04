import { Injectable } from '@nestjs/common';
import { Prisma, Offering } from '@prisma/client';
import { PrismaService } from '../prisma.service';

@Injectable()
export class OfferingService {
  constructor(private prisma: PrismaService) {}

  async offering(
    offeringWhereInput: Prisma.OfferingWhereUniqueInput,
  ): Promise<Offering | null> {
    return this.prisma.offering.findUnique({
      where: offeringWhereInput,
    });
  }

  async offerings(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.OfferingWhereUniqueInput;
    where?: Prisma.OfferingWhereInput;
    orderBy?: Prisma.OfferingOrderByWithRelationInput;
  }): Promise<Offering[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.offering.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createOffering(data: Prisma.OfferingCreateInput): Promise<Offering> {
    return this.prisma.offering.create({
      data,
    });
  }

  async updateOffering(params: {
    where: Prisma.OfferingWhereUniqueInput;
    data: Prisma.OfferingUpdateInput;
  }): Promise<Offering> {
    const { where, data } = params;
    return this.prisma.offering.update({
      data,
      where,
    });
  }

  async deleteOffering(where: Prisma.OfferingWhereUniqueInput): Promise<Offering> {
    return this.prisma.offering.delete({
      where,
    });
  }
}
