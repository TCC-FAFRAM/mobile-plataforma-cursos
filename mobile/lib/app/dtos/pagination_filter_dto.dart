import 'pagination_dto.dart';

final class PaginationFilterDTO<T> extends PaginationDTO {
  T? filter;
  PaginationFilterDTO(
      {super.codigo,
      required super.take,
      required super.skip,
      super.search,
      super.orderBy,
      this.filter});
}
