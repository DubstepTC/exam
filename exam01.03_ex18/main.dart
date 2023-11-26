import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _objectSize = 100.0;

  void _increaseSize() {
    setState(() {
      _objectSize += 10.0;
    });
  }

  void _decreaseSize() {
    setState(() {
      _objectSize -= 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Нажмите на кнопку, чтобы изменить размер:',
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _increaseSize,
              child: Container(
                width: _objectSize,
                height: _objectSize,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _increaseSize,
                  child: Text('Увеличить'),
                ),
                ElevatedButton(
                  onPressed: _decreaseSize,
                  child: Text('Уменьшить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
