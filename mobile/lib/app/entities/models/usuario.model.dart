// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsuarioModel {
  final int idUsuario;
  final String nome;
  final String sobreNome;
  final String email;
  final String? senha;
  final String cpf;
  final String tipo;
  final DateTime dataCadastro;

  UsuarioModel({
    required this.idUsuario,
    required this.nome,
    required this.sobreNome,
    required this.email,
    this.senha,
    required this.cpf,
    required this.tipo,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': idUsuario,
      'nome': nome,
      'sobre_nome': sobreNome,
      'email': email,
      'senha': senha,
      'cpf': cpf,
      'tipo': tipo,
      'data_cadastro': dataCadastro.toIso8601String(),
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      idUsuario: map['id_usuario'],
      nome: map['nome'],
      sobreNome: map['sobre_nome'],
      email: map['email'],
      senha: map['senha'],
      cpf: map['cpf'],
      tipo: map['tipo'],
      dataCadastro: DateTime.parse(map['data_cadastro']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}
