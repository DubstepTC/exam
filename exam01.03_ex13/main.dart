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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пример уведомлений'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showDialogAndSnackbar(context);
              },
              child: Text(
                'Показать диалог и уведомление',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogAndSnackbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Диалоговое окно'),
          content: const Text('Это диалоговое окно.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    _showSnackbar(context, 'Короткое уведомление', 2);

    Future.delayed(Duration(seconds: 2), () {
      AnimatedSnackBar.showCustomSnackBar(context, 'Длинное уведомление', durationSeconds: 5);
    });
  }

  void _showSnackbar(BuildContext context, String message, int durationSeconds) {
    AnimatedSnackBar.showCustomSnackBar(context, message, durationSeconds: durationSeconds);
  }
}

class AnimatedSnackBar {
  static void showCustomSnackBar(BuildContext context, String message, {int durationSeconds = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: durationSeconds),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
