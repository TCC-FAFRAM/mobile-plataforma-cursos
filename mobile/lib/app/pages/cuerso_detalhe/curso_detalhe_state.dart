import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dtos/home/painel_home.dto.dart';

part 'curso_detalhe_state.g.dart';

@match
enum CursoDetalheStateStatus {
  initial,
  loading,
  loaded,
  error,
}

final class CursoDetalheState extends Equatable {
  final CursoDetalheStateStatus status;
  // final List<HorasGeral> horasExtras;
  final PainelHomeDTO? painelHome;
  final bool visibleMoney;
  final String? errorMessage;

  const CursoDetalheState(
      {required this.status,
      //    this.horasExtras = const [],
      this.visibleMoney = false,
      this.errorMessage,
      this.painelHome});

  const CursoDetalheState.initial()
      : status = CursoDetalheStateStatus.initial,
        //   horasExtras = const [],
        visibleMoney = false,
        errorMessage = null,
        painelHome = null;

  @override
  List<Object?> get props => [status, errorMessage, visibleMoney, painelHome];

  CursoDetalheState copyWith({
    CursoDetalheStateStatus? status,
    //  List<HorasGeral>? horasExtras,
    bool? visibleMoney,
    String? errorMessage,
    PainelHomeDTO? painelHome,
  }) {
    return CursoDetalheState(
      status: status ?? this.status,
      //  horasExtras: horasExtras ?? this.horasExtras,
      visibleMoney: visibleMoney ?? this.visibleMoney,
      errorMessage: errorMessage ?? this.errorMessage,
      painelHome: painelHome ?? this.painelHome,
    );
  }
}
