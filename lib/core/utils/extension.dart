import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension ColorExtension on Color {
  static Color setFromList(List<double> value) {
    return Color.fromRGBO(
      value[0].toInt(),
      value[1].toInt(),
      value[2].toInt(),
      value[3],
    );
  }
}
