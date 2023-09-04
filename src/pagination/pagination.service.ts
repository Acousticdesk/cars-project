import { Injectable } from '@nestjs/common';

interface PaginationParams {
  page: number;
  perPage: number;
}

class Pagination {
  offset: number;

  constructor({ page, perPage }: PaginationParams) {
    this.offset = (page - 1) * perPage;
  }
}

@Injectable()
export class PaginationService {
  constructor() {}
  constructPagination(params) {
    return new Pagination(params);
  }
}
