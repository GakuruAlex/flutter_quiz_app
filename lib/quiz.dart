import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/home_ui.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'home-screen';

  Map<int, List<String>> shuffledAnswers = {};

  List<String> selectedAnswers = List<String>.filled(questions.length, '');

  void switchScreen(String screen) {
    setState(() {
      currentScreen = screen;
    });
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
                : currentScreen == 'questions_screen'
                ? QuestionScreen(
                    switchScreen: switchScreen,
                    shuffledAnswers: shuffledAnswers,
                    selectedAnswer: selectedAnswers,
                  )
                : ResultsScreen(),
          ),
        ),
      ),
    );
  }
}
