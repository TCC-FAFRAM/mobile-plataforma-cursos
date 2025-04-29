// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'modulo.model.dart';

class CursoModel {
  final int idCurso;
  final String titulo;
  final String descricao;
  final String imagem;
  final List<ModuloModel> modulos;

  CursoModel({
    required this.idCurso,
    required this.titulo,
    required this.imagem,
    required this.descricao,
    required this.modulos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_curso': idCurso,
      'titulo': titulo,
      'url_img': imagem,
      'descricao': descricao,
      'Modulos': modulos.map((x) => x.toMap()).toList(),
    };
  }

  factory CursoModel.fromMap(Map<String, dynamic> map) {
    return CursoModel(
      idCurso: map['id_curso'] as int,
      titulo: map['titulo'] as String,
      imagem: map['url_img'] as String,
      descricao: map['descricao'] as String,
      modulos: List<ModuloModel>.from(
        (map['Modulos'] ?? []).map((x) => ModuloModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CursoModel.fromJson(String source) =>
      CursoModel.fromMap(json.decode(source));
}
