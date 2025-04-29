// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AulaModel {
  final int idAula;
  final String titulo;
  final String urlVideo;
  final int duracao;
  final String? descricao;

  AulaModel({
    required this.idAula,
    required this.titulo,
    required this.urlVideo,
    required this.duracao,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_aula': idAula,
      'titulo': titulo,
      'url_video': urlVideo,
      'duracao': duracao,
      'descricao': descricao,
    };
  }

  factory AulaModel.fromMap(Map<String, dynamic> map) {
    return AulaModel(
      idAula: map['id_aula'] as int,
      titulo: map['titulo'] as String,
      urlVideo: map['url_video'] as String,
      duracao: map['duracao'] as int,
      descricao: map['descricao'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AulaModel.fromJson(String source) =>
      AulaModel.fromMap(json.decode(source));
}
