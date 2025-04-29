import 'package:app/app/entities/models/curso.model.dart';

import '../../dtos/pagination_dto.dart';

abstract interface class CursoService {
  Future<List<CursoModel>> list(PaginationDTO params);
}
