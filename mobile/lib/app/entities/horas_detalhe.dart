// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HorasDetalhe {
  final int codigo;
  final String data;
  final String inicioAtividade;
  final String fimAtividade;
  final String descricaoAtividade;
  HorasDetalhe({
    required this.codigo,
    required this.data,
    required this.inicioAtividade,
    required this.fimAtividade,
    required this.descricaoAtividade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'data': data,
      'inicioAtividade': inicioAtividade,
      'fimAtividade': fimAtividade,
      'descricaoAtividade': descricaoAtividade,
    };
  }

  factory HorasDetalhe.fromMap(Map<String, dynamic> map) {
    return HorasDetalhe(
      codigo: map['codigo'] as int,
      data: map['data'] as String,
      inicioAtividade: map['inicioAtividade'] as String,
      fimAtividade: map['fimAtividade'] as String,
      descricaoAtividade: map['descricaoAtividade'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HorasDetalhe.fromJson(String source) =>
      HorasDetalhe.fromMap(json.decode(source) as Map<String, dynamic>);
}
