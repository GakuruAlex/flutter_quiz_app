import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key, required this.switchScreen});
  final void Function(String) switchScreen;
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
          style: GoogleFonts.notoSansDisplay(fontSize: 24, color: Colors.white),
        ),

        QuizButton(
          contentText: 'Start',
          switchScreen: switchScreen,
          chosenIcon: nextArrow,
          page: 'questions-screen',
        ),
      ],
    );
  }
}
