// lib/main.dart

import 'package:flutter/material.dart';
import 'custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.myCustomTheme, // Используем нашу кастомную тему
      home: MyHomeWidget(),
    );
  }
}
