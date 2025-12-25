import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.contentText,
    required this.switchScreen,
  });
  final String contentText;
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: switchScreen,
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 253, 252, 252),
      ),
      icon: Icon(
        Icons.arrow_circle_right_outlined,
        color: Color.fromARGB(255, 248, 247, 247),
      ),

      label: Text(
        contentText,
      ),
    );
  }
}
