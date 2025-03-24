part of './formatter_extension.dart';

extension FormatterTimeOfDayExtension on TimeOfDay {
  String get timePTBR {
    final dateFormat = DateFormat('HH:mm');

    DateTime dateTimeLocal = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hour,
      minute,
    );

    return dateFormat.format(dateTimeLocal);
  }
}
