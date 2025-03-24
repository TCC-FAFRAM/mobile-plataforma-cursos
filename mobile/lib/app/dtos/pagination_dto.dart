import 'base_dto.dart';

class PaginationDTO<T> implements BaseDTO {
  final T? codigo;
  final int take;
  final int skip;
  final String? search;
  final String? orderBy;

  PaginationDTO({
    this.codigo,
    required this.take,
    required this.skip,
    this.search,
    this.orderBy,
  });
}
