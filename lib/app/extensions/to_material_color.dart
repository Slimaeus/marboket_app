import 'package:flutter/material.dart';

extension ToMaterialColor on Color {
  MaterialColor get asMaterialColor {
    Map<int, Color> shades = [
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ].asMap().map(
        (key, value) => MapEntry(value, withOpacity(1 - (1 - (key + 1) / 10))));

    return MaterialColor(value, shades);
  }
}
