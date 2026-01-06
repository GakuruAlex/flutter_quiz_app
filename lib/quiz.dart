import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/home_ui.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'home-screen';
  int score = 0;

  Map<int, List<String>> shuffledAnswers = {};

  List<String> selectedAnswers = List<String>.filled(questions.length, '');
  int _currentQuestionIndex = 0;
  // ignore: unused_field
  QuizQuestion _currentQuestion = questions[0];

  @override
  void initState() {
    super.initState();

    _currentQuestion = questions[_currentQuestionIndex];
  }

  void switchScreen(String page) {
    if (page == 'next' || page == 'prev') {
      page == 'next' ? _currentQuestionIndex += 1 : _currentQuestionIndex -= 1;
      setState(() {
        _currentQuestion = questions[_currentQuestionIndex];
      });
    } else {
      setState(() {
        currentScreen = page;
      });
    }
  }

  void getScore() {
    if (selectedAnswers.length == questions.length) {
      int total = 0;

      for (var i = 0; i < questions.length; i++) {
        if (questions[i].answers[0] == selectedAnswers[i]) {
          total += 1;
        }
      }

      setState(() {
        score = total;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
            ),
          ),
          child: Center(
            child: currentScreen == 'home-screen'
                ? HomeUI(switchScreen: switchScreen)
                : currentScreen == 'questions-screen'
                ? QuestionScreen(
                    switchScreen: switchScreen,
                    shuffledAnswers: shuffledAnswers,
                    selectedAnswers: selectedAnswers,
                    currentQuestionIndex: _currentQuestionIndex,
                    currentQuestion: _currentQuestion,
                    getScore: getScore,
                  )
                : ResultsScreen(selectedAnswers: selectedAnswers, score: score),
          ),
        ),
      ),
    );
  }
}
