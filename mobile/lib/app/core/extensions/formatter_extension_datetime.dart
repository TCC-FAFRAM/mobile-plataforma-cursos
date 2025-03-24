part of './formatter_extension.dart';

extension FormatterDateExtension on DateTime {
  String get dateSQL {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return dateFormat.format(this);
  }

  String get datePTBR {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return dateFormat.format(this);
  }

  String get dateTimePTBR {
    final dateFormat = DateFormat('dd/MM/yyyy  HH:mm');

    return dateFormat.format(this);
  }

  String get timePTBR {
    final dateFormat = DateFormat('HH:mm');

    return dateFormat.format(this);
  }
}
