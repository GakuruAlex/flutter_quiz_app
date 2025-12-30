import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz_button.dart';

class HomeUI extends StatelessWidget {
  const HomeUI(this.quizScreen, {super.key});
  final void Function() quizScreen;
  final IconData nextArrow = Icons.arrow_circle_right_outlined;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 30.0,

      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(187, 250, 249, 248),
        ),

        Text(
          'Learn Flutter The Fun Way!',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),

        QuizButton(
          contentText: 'Start Quiz',
          switchScreen: quizScreen,
          chosenIcon: nextArrow,
        ),
      ],
    );
  }
}
