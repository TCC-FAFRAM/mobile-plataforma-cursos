import 'package:flutter/widgets.dart';

final class PopMenuModel<T> {
  T value;
  String label;
  String description;
  Color color;
  Icon? icon;

  PopMenuModel(
      {required this.value,
      required this.label,
      required this.color,
      required this.description,
      this.icon});
}
