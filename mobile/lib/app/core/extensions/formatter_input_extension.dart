import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length <= 2) {
      return TextEditingValue(
        text: '($text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 6) {
      return TextEditingValue(
        text: '(${text.substring(0, 2)}) ${text.substring(2)}',
        selection: TextSelection.collapsed(offset: text.length + 4),
      );
    } else if (text.length <= 10) {
      return TextEditingValue(
        text:
            '(${text.substring(0, 2)}) ${text.substring(2, 6)}-${text.substring(6)}',
        selection: TextSelection.collapsed(offset: text.length + 5),
      );
    } else {
      return TextEditingValue(
        text:
            '(${text.substring(0, 2)}) ${text.substring(2, 7)}-${text.substring(7, 11)}',
        selection: TextSelection.collapsed(offset: text.length + 5),
      );
    }
  }
}

class CellPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length <= 2) {
      return TextEditingValue(
        text: '($text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 7) {
      return TextEditingValue(
        text: '($text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else {
      return TextEditingValue(
        text: '($text',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    }
  }
}
