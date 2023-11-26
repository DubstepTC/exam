import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          <Widget>[
            Container(
              width: 300, // Задаем ширину контейнера
              height: 50, // Задаем высоту контейнера
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple), // Устанавливаем границу
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Убираем внутренние границы текстового поля
                  contentPadding: EdgeInsets.all(10), // Задаем отступ внутри поля
                ),
              ),
            ),
            const SizedBox(height: 60,),
            // Ряд 1
            buildButtonRow(['7', '8', '9', '/']),
            const SizedBox(height: 20,),
            // Ряд 2
            buildButtonRow(['4', '5', '6', 'x']),
            const SizedBox(height: 20,),
            // Ряд 3
            buildButtonRow(['1', '2', '3', '-']),
            const SizedBox(height: 20,),
            // Ряд 4
            buildButtonRow(['C', '0', '=', '+']),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts
          .map((text) => TextButton(
                onPressed: () {
                  // Действия при нажатии кнопки
                },
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24.0),
                ),
              ))
          .toList(),
    );
  }
}
