part of './formatter_extension.dart';

extension FormatterDoubleExtension on double? {
  String get currencyPTBR {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');

    return currencyFormat.format(this);
  }

  String get decimal2house {
    final numberFormat = NumberFormat("#,##0.00", "pt_BR");

    return numberFormat.format(this);
  }

  String get noDecimal {
    final numberFormat = NumberFormat("#,##0", "pt_BR");

    return numberFormat.format(this);
  }

  String get kgFormat {
    if (this == null) {
      return '0,00';
    }
    String formattedValue = this!.toStringAsFixed(2);
    List<String> parts = formattedValue.split('.');

    if (parts.length == 2) {
      String beforeDecimal = parts[0];
      String afterDecimal = parts[1];

      formattedValue = '$beforeDecimal,$afterDecimal';
    }

    return formattedValue;
  }
}
