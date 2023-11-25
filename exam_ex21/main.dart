import 'package:flutter/material.dart';
import 'product_detail_screen.dart'; // Импорт вашего экрана с подробной информацией о товаре

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
        productName: 'Ручка гелевая',
        description: 'Отличная ручка для письма и рисования.',
        price: 2.99,
      ), // Вызываем ваш экран с данными о товаре
    );
  }
}
