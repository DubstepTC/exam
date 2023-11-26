import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Личный кабинет',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Фамилия',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Адрес электронной почты',
              ),
            ),
            // Другие поля настроек...

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Логика сохранения настроек
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
