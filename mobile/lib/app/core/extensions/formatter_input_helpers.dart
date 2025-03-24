import 'package:flutter/services.dart';

sealed class FormatterInputHelpers {
  static var inputFormaterNumber =
      FilteringTextInputFormatter.allow(RegExp(r'^[0-9,.]*$'));
}
