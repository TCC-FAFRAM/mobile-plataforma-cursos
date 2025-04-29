// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'aula.model.dart';

class ModuloModel {
  final int idModulo;
  final String titulo;
  final String descricao;
  final int ordem;
  final bool concluido;
  final List<AulaModel> aulas;

  ModuloModel({
    required this.idModulo,
    required this.titulo,
    required this.descricao,
    required this.ordem,
    required this.concluido,
    required this.aulas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_modulo': idModulo,
      'titulo': titulo,
      'descricao': descricao,
      'ordem': ordem,
      'concluido': concluido,
      'Aulas': aulas.map((x) => x.toMap()).toList(),
    };
  }

  factory ModuloModel.fromMap(Map<String, dynamic> map) {
    return ModuloModel(
      idModulo: map['id_modulo'] as int,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      ordem: map['ordem'] as int,
      concluido: map['concluido'] as bool,
      aulas: List<AulaModel>.from(
        (map['Aulas'] ?? []).map((x) => AulaModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuloModel.fromJson(String source) =>
      ModuloModel.fromMap(json.decode(source));
}
