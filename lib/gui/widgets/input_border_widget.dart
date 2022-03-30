import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String labelText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0)
      )
    );
  }
}
