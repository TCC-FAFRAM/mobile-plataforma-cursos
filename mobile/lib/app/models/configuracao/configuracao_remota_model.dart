import 'dart:convert';

final class ConfiguracaoRemotaModel {
  final String id;
  final String ativo;
  final String nome;
  final String servidor;
  final int porta;
  ConfiguracaoRemotaModel({
    required this.id,
    required this.ativo,
    required this.nome,
    required this.servidor,
    required this.porta,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ativo': ativo,
      'nome': nome,
      'servidor': servidor,
      'porta': porta,
    };
  }

  factory ConfiguracaoRemotaModel.fromMap(Map<String, dynamic> map) {
    return ConfiguracaoRemotaModel(
      id: map['ID'].toString(),
      ativo: map['Ativo'] != null ? map['Ativo'].toString() : '',
      nome: map['NOME'].toString(),
      servidor: map['SERVIDOR'].toString(),
      porta: map['PORTA'] != null ? map['PORTA']!.toInt() as int : 9500,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfiguracaoRemotaModel.fromJson(String source) =>
      ConfiguracaoRemotaModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
