import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../entities/usuario.dart';

part 'login_state.g.dart';

@match
enum LoginStateStatus {
  initial,
  loading,
  loaded,
  error,
  sucess,
  warning,
  typeUser,
}

final class LoginState extends Equatable {
  final LoginStateStatus status;
  final bool newVersion;
  final String? urlPublished;
  final String? message;
  final String? user;

  const LoginState({
    required this.status,
    this.newVersion = false,
    this.urlPublished,
    this.message,
    required this.user,
  });

  const LoginState.initial()
      : status = LoginStateStatus.initial,
        newVersion = false,
        urlPublished = null,
        message = null,
        user = null;

  @override
  List<Object?> get props => [status, message, user];

  LoginState copyWith({
    LoginStateStatus? status,
    bool? newVersion,
    String? urlPublished,
    String? message,
    String? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      newVersion: newVersion ?? this.newVersion,
      urlPublished: urlPublished ?? this.urlPublished,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
