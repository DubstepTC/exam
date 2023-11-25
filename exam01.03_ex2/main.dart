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
          children: <Widget>[
            // Ряд 1
            buildButtonRow(['7', '8', '9', '/']),
            // Ряд 2
            buildButtonRow(['4', '5', '6', 'x']),
            // Ряд 3
            buildButtonRow(['1', '2', '3', '-']),
            // Ряд 4
            buildButtonRow(['C', '0', '=', '+']),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts
          .map((text) => FlatButton(
                padding: EdgeInsets.all(16.0),
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
