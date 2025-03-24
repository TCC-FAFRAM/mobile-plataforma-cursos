import 'base_dto.dart';

class SincronizacaoDTO implements BaseDTO {
  final int statusCode;
  final List<Map<String, dynamic>>? reponseList;
  final Map<String, dynamic>? reponse;
  SincronizacaoDTO({
    required this.statusCode,
    this.reponseList,
    this.reponse,
  });
}
