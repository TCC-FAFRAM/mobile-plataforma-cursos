class PainelHomeDTO {
  final double somaHorasExtra;
  final double totalMoneyExtra;

  final double totalHorasTrabalhada;
  final double valorHoraTrabalhada;

  final int diasTrabalhados;
  final double valorDiaTrabalhado;

  PainelHomeDTO({
    required this.somaHorasExtra,
    required this.totalHorasTrabalhada,
    required this.valorHoraTrabalhada,
    required this.totalMoneyExtra,
    required this.diasTrabalhados,
    required this.valorDiaTrabalhado,
  });
}
