import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dtos/home/painel_home.dto.dart';
import '../../entities/models/curso.model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
  warning,
  success,
}

final class HomeState extends Equatable {
  final HomeStateStatus status;
  final PainelHomeDTO? painelHome;
  final String? tipoUser;
  final String? message;
  final String? name;
  final String? email;
  final List<CursoModel> items;
  final bool fecth;
  final int pagina;

  const HomeState(
      {required this.status,
      this.tipoUser,
      this.message,
      this.painelHome,
      this.name,
      this.email,
      required this.items,
      required this.fecth,
      required this.pagina});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        tipoUser = null,
        message = null,
        painelHome = null,
        name = null,
        email = null,
        items = const [],
        fecth = false,
        pagina = 0;

  @override
  List<Object?> get props => [
        status,
        message,
        tipoUser,
        painelHome,
        name,
        email,
        items,
        fecth,
        pagina
      ];

  HomeState copyWith(
      {HomeStateStatus? status,
      String? tipoUser,
      String? message,
      PainelHomeDTO? painelHome,
      String? name,
      String? email,
      List<CursoModel>? items,
      bool? fecth,
      int? pagina}) {
    return HomeState(
        status: status ?? this.status,
        tipoUser: tipoUser ?? this.tipoUser,
        message: message ?? this.message,
        painelHome: painelHome ?? this.painelHome,
        name: name ?? this.name,
        email: email ?? this.email,
        items: items ?? this.items,
        fecth: fecth ?? this.fecth,
        pagina: pagina ?? this.pagina);
  }
}
