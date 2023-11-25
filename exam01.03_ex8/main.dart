import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue]; // Цвета для фона экрана

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomBar Example'),
      ),
      body: Container(
        color: _colors[_currentIndex], // Устанавливаем цвет фона в зависимости от текущего индекса
        child: Center(
          child: Text(
            'Экран с цветом ${_colors[_currentIndex]}',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Красный',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Зеленый',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Синий',
          ),
        ],
      ),
    );
  }
}
