import 'dart:convert';

import '../../entities/usuario.dart';

final class AutenticacaoModel {
  final Usuario user;
  final String accessToken;
  final String refreshToken;
  AutenticacaoModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AutenticacaoModel.fromMap(Map<String, dynamic> map) {
    return AutenticacaoModel(
      user: Usuario.fromMap(map['user'] as Map<String, dynamic>),
      accessToken: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutenticacaoModel.fromJson(String source) =>
      AutenticacaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AutenticacaoModel copyWith({
    Usuario? user,
    String? accessToken,
    String? refreshToken,
  }) {
    return AutenticacaoModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
