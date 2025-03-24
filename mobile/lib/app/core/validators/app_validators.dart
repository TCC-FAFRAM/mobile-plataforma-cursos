import 'package:flutter/widgets.dart';

sealed class AppValidators {
  static FormFieldValidator compare(
      TextEditingController? valueEC, String message) {
    return (value) {
      final valueCompare = valueEC?.text ?? '';

      if (value == null || (value != null && value != valueCompare)) {
        return message;
      }
      return null;
    };
  }
}
