import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Личный кабинет'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              'Имя пользователя',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'example@email.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Действие по изменению пароля
              },
              child: Text('Изменить пароль'),
            ),
            ElevatedButton(
              onPressed: () {
                // Действие по выходу из аккаунта
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
