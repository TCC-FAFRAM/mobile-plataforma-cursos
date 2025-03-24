import 'dart:convert';

import 'usuario.dart';

final class UsuarioToken {
  final Usuario user;
  final String token;
  final String refreshToken;

  UsuarioToken({
    required this.user,
    required this.token,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  factory UsuarioToken.fromMap(Map<String, dynamic> map) {
    return UsuarioToken(
      user: Usuario.fromMap(map['user'] as Map<String, dynamic>),
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioToken.fromJson(String source) =>
      UsuarioToken.fromMap(json.decode(source) as Map<String, dynamic>);

  UsuarioToken copyWith({
    Usuario? user,
    String? token,
    String? refreshToken,
  }) {
    return UsuarioToken(
      user: user ?? this.user,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  String toString() =>
      'UsuarioToken(user: $user, token: $token, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant UsuarioToken other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.token == token &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode ^ refreshToken.hashCode;
}
