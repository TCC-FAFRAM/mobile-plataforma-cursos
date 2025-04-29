import 'base_dto.dart';

class PaginationDTO<T> implements BaseDTO {
  final T? data;
  final int take;
  final int pagina;
  final String? search;
  final String? orderBy;

  PaginationDTO({
    this.data,
    this.take = 10,
    required this.pagina,
    this.search,
    this.orderBy,
  });

  int get skip => pagina * take;
}
