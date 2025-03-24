import 'dart:convert';

final class Usuario {
  final int? id;
  final String nome;
  final String email;
  final String? tipo;
  final String sobreNome;
  final String? senha;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    this.tipo,
    required this.sobreNome,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tipo': tipo,
      'sobre_nome': sobreNome,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      email: map['email'] as String,
      tipo: map['tipo'] != null ? map['tipo'] as String : null,
      sobreNome: map['sobre_nome'] as String,
      senha: map['senha'] != null ? map['senha'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  Usuario copyWith({
    int? id,
    String? nome,
    String? email,
    String? tipo,
    String? sobreNome,
    String? senha,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      tipo: tipo ?? this.tipo,
      sobreNome: sobreNome ?? this.sobreNome,
      senha: senha ?? this.senha,
    );
  }

  @override
  String toString() =>
      'Usuario(id: $id, nome: $nome, email: $email, tipo: $tipo , sobreNome: $sobreNome)';

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.tipo == tipo &&
        other.sobreNome == sobreNome;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      tipo.hashCode ^
      sobreNome.hashCode;
}
