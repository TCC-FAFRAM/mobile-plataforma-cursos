import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dtos/home/painel_home.dto.dart';

part 'aula_state.g.dart';

@match
enum AulaStateStatus {
  initial,
  loading,
  loaded,
  error,
}

final class AulaState extends Equatable {
  final AulaStateStatus status;
  //final List<HorasGeral> horasExtras;
  final PainelHomeDTO? painelHome;
  final bool visibleMoney;
  final String? errorMessage;

  const AulaState(
      {required this.status,
      //     this.horasExtras = const [],
      this.visibleMoney = false,
      this.errorMessage,
      this.painelHome});

  const AulaState.initial()
      : status = AulaStateStatus.initial,
        //   horasExtras = const [],
        visibleMoney = false,
        errorMessage = null,
        painelHome = null;

  @override
  List<Object?> get props => [status, errorMessage, visibleMoney, painelHome];

  AulaState copyWith({
    AulaStateStatus? status,
//    List<HorasGeral>? horasExtras,
    bool? visibleMoney,
    String? errorMessage,
    PainelHomeDTO? painelHome,
  }) {
    return AulaState(
      status: status ?? this.status,
      // horasExtras: horasExtras ?? this.horasExtras,
      visibleMoney: visibleMoney ?? this.visibleMoney,
      errorMessage: errorMessage ?? this.errorMessage,
      painelHome: painelHome ?? this.painelHome,
    );
  }
}
