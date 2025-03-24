part of './formatter_extension.dart';

extension FormatterStringExtension on String {
  DateTime get mapDynamicDate {
    final RegExp regex = RegExp(r'^[0-9]+$');

    if (regex.hasMatch(toString())) {
      return DateTime.fromMillisecondsSinceEpoch(int.parse(this));
    } else {
      return DateTime.parse(this);
    }
  }

  double get stringToDouble {
    try {
      final numberFormat = NumberFormat("#,##0.00", "pt_BR");
      return numberFormat.parse(this == '' ? '0' : this) as double;
    } catch (e) {
      return 0;
    }
  }

  DateTime get stringToDate {
    try {
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final DateFormat dateFormatptBR = DateFormat('dd/MM/yyyy');

      return dateFormat.parse(
        this == ''
            ? DateTime.now().toString()
            : dateFormatptBR.parse(this).toString(),
      );
    } catch (e) {
      return DateTime.now();
    }
  }

  String get phoneNumberFormat {
    if (isEmpty) {
      return '(__)____-____';
    }
    final regex = RegExp(r'^(\d{2})(\d{2})(\d{3})(\d{4})$');
    if (regex.hasMatch(this)) {
      return '(${regex.firstMatch(this)!.group(1)}) ${regex.firstMatch(this)!.group(2)} ${regex.firstMatch(this)!.group(3)}-${regex.firstMatch(this)!.group(4)}';
    } else {
      return this;
    }
  }

  String get cnpjFormat {
    if (isEmpty) {
      return '__.___.___/____-__';
    }

    final regex = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$');
    if (regex.hasMatch(this)) {
      return '${regex.firstMatch(this)!.group(1)}.${regex.firstMatch(this)!.group(2)}.${regex.firstMatch(this)!.group(3)}/${regex.firstMatch(this)!.group(4)}-${regex.firstMatch(this)!.group(5)}';
    } else {
      return this;
    }
  }

  String get cpfFormat {
    if (isEmpty) {
      return '___.___.___-__';
    }

    final regex = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    if (regex.hasMatch(this)) {
      return '${regex.firstMatch(this)!.group(1)}.${regex.firstMatch(this)!.group(2)}.${regex.firstMatch(this)!.group(3)}-${regex.firstMatch(this)!.group(4)}';
    } else {
      return this; // Return the original string if the format is invalid
    }
  }
}
