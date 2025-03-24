import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dtos/home/painel_home.dto.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

final class HomeState extends Equatable {
  final HomeStateStatus status;
  final PainelHomeDTO? painelHome;
  final String? tipoUser;
  final String? message;
  final String? name;
  final String? email;

  const HomeState(
      {required this.status,
      this.tipoUser,
      this.message,
      this.painelHome,
      this.name,
      this.email});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        tipoUser = null,
        message = null,
        painelHome = null,
        name = null,
        email = null;

  @override
  List<Object?> get props =>
      [status, message, tipoUser, painelHome, name, email];

  HomeState copyWith(
      {HomeStateStatus? status,
      //  List<HorasGeral>? horasExtras,
      String? tipoUser,
      String? message,
      PainelHomeDTO? painelHome,
      String? name,
      String? email}) {
    return HomeState(
      status: status ?? this.status,
      tipoUser: tipoUser ?? this.tipoUser,
      message: message ?? this.message,
      painelHome: painelHome ?? this.painelHome,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
