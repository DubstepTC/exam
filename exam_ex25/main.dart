import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam_ex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;

  List<Question> questions = [
    Question(
      questionText: "What's the capital of France?",
      options: ["London", "Paris", "Berlin", "Madrid"],
      correctAnswerIndex: 1,
    ),
    // Добавь еще вопросов здесь
  ];

  void checkAnswer() {
    if (selectedAnswerIndex != null) {
      if (selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Correct!'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Incorrect!'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam_ex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions[currentQuestionIndex].options.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  title: Text(questions[currentQuestionIndex].options[index]),
                  value: index,
                  groupValue: selectedAnswerIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswerIndex = value as int;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
                setState(() {
                  // Переходим к следующему вопросу после проверки ответа
                  if (currentQuestionIndex < questions.length - 1) {
                    currentQuestionIndex += 1;
                    selectedAnswerIndex = null; // Сбрасываем выбранный ответ
                  } else {
                    // Если это последний вопрос, можем выполнить какие-то действия, например, показать результаты теста
                  }
                });
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
