// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TentativaProvaModel {
  final int idTentativaProva;
  final int fkIdFuncionario;
  final int fkIdProva;
  final double nota;
  final DateTime dataTentativa;
  final bool passou;

  TentativaProvaModel({
    required this.idTentativaProva,
    required this.fkIdFuncionario,
    required this.fkIdProva,
    required this.nota,
    required this.dataTentativa,
    required this.passou,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_tentativa_prova': idTentativaProva,
      'fk_id_funcionario': fkIdFuncionario,
      'fk_id_prova': fkIdProva,
      'nota': nota,
      'data_tentativa': dataTentativa.toIso8601String(),
      'passou': passou,
    };
  }

  factory TentativaProvaModel.fromMap(Map<String, dynamic> map) {
    return TentativaProvaModel(
      idTentativaProva: map['id_tentativa_prova'],
      fkIdFuncionario: map['fk_id_funcionario'],
      fkIdProva: map['fk_id_prova'],
      nota: map['nota'].toDouble(),
      dataTentativa: DateTime.parse(map['data_tentativa']),
      passou: map['passou'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TentativaProvaModel.fromJson(String source) =>
      TentativaProvaModel.fromMap(json.decode(source));
}
