import 'package:flutter/material.dart';

class FirstWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Первое окно'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Перейти ко второму окну'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondWindow()),
            );
          },
        ),
      ),
    );
  }
}

class SecondWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второе окно'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Вернуться к первому окну'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
