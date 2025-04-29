import 'package:app/app/entities/models/curso.model.dart';

import '../../core/exceptions/service_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/app_rest_client.dart';
import '../../core/rest_client/app_rest_client_exception.dart';
import '../../core/utils/app_routers_remote.dart';
import '../../dtos/pagination_dto.dart';
import 'curso_service.dart';

class CursoServiceImpl implements CursoService {
  final AppLogger _logger;
  final AppRestClient _restClient;

  CursoServiceImpl({
    required AppLogger logger,
    required AppRestClient restClient,
  })  : _logger = logger,
        _restClient = restClient;

  @override
  Future<List<CursoModel>> list(PaginationDTO params) async {
    try {
      Map<String, dynamic> queryParams = {
        'take': params.take,
        'skip': params.skip,
        'search': params.search,
      };

      final result = await _restClient.auth().get(
            queryParameters: queryParams,
            AppRoutersRemote.cursos,
          );

      List<CursoModel> list = [];

      if (result.data != null &&
          result.data.length > 0 &&
          result.data != "[]") {
        for (var value in result.data) {
          var data = CursoModel.fromMap(value);
          list.add(data);
        }
      }

      return list;
    } catch (e, s) {
      var error = e as AppRestClientException;
      if (error.statusCode == null) {
        throw ServiceException(message: error.message);
      }
      _logger.error(e, s);
      throw ServiceException;
    }
  }
}
