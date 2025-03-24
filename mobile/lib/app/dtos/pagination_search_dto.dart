import 'base_dto.dart';

final class PaginationSearchDTO<T, C> implements BaseDTO {
  int page;
  String? search;
  String? orderBy;
  T? filter;
  C? parameters;
  PaginationSearchDTO({
    required this.page,
    this.search,
    this.orderBy,
    this.filter,
    this.parameters,
  });

  final int _take = 10;

  int get take => _take;
  int get skip => (_take * (this.page - 1));
}
