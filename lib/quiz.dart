import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_ui.dart';
import 'package:flutter_quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      currentScreen = 'questions-screen';
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
                ? HomeUI(switchScreen)
                : QuestionScreen(),
          ),
        ),
      ),
    );
  }
}
