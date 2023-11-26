import 'package:flutter/material.dart';
import 'cosmetick.dart'; // Импорт вашего экрана с подробной информацией о товаре

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam_ex21',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailScreen(
        productName: 'Что-то',
        description: 'Описание',
        price: 5550,
      ), // Вызываем ваш экран с данными о товаре
    );
  }
}
