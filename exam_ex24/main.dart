import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExamScreen(),
    );
  }
}

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  Map<String, bool> answers = {
    'Вопрос 1: Что такое Flutter?': false,
    'Вопрос 2: Какие основные языки программирования используются в Flutter?': false,
    // Другие вопросы с вариантами ответов
  };
  int correctAnswers = 0;
  late Timer _timer;
  int _seconds = 60; // Задаем время теста в секундах

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
        // Здесь можно добавить логику для автоматической отправки результатов при истечении времени
        // Например, показать диалоговое окно с результатами
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тест по Flutter'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Оставшееся время: $_seconds секунд',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView(
              children: answers.keys.map((String question) {
                return CheckboxListTile(
                  title: Text(question),
                  value: answers[question],
                  onChanged: (bool? value) {
                    setState(() {
                      answers[question] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                correctAnswers = 0;
                answers.forEach((question, isCorrect) {
                  if (isCorrect) {
                    correctAnswers++;
                  }
                });
                // Здесь можно добавить логику для отображения результатов теста
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Результаты теста'),
                      content: Text('Правильных ответов: $correctAnswers из ${answers.length}'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Закрыть'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              });
            },
            child: Text('Завершить тест'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Отменяем таймер при завершении экрана
    super.dispose();
  }
}
