import 'package:flutter/material.dart';

void main() {
  runApp(TourismApp());
}

class TourismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Туристическое агентство'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Лучшие путешествия',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Откройте для себя самые захватывающие туры и приключения!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                _buildTourCard('Париж', 'Романтический город света', 'paris.jpg', context),
                _buildTourCard('Токио', 'Город современных технологий', 'tokyo.jpg', context),
                // Добавь еще карточек туров здесь
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTourCard(String title, String description, String imagePath, BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/$imagePath'),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            // Обработка нажатия кнопки "Узнать больше"
          },
          child: Text('Узнать больше'),
        ),
        onTap: () {
          // Обработка нажатия на карточку тура
        },
      ),
    );
  }
}
