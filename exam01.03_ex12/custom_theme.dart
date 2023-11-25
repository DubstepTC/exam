// lib/custom_theme.dart

import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData myCustomTheme = ThemeData(
    // Определяем цвета
    primaryColor: Colors.purple, // Основной цвет
    accentColor: Colors.amber, // Дополнительный цвет
    // Определяем шрифты
    fontFamily: 'Roboto', // Например, используем шрифт Roboto
    // Определяем другие свойства темы (например, типографику, отступы и т.д.)
  );
}
