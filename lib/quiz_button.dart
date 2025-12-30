import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.contentText,
    required this.switchScreen,
    required this.chosenIcon,
  });
  final String contentText;
  final void Function() switchScreen;
  final IconData chosenIcon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: switchScreen,
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 253, 252, 252),
        iconAlignment: IconAlignment.end,
        fixedSize: Size(140, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),

      label: Text(
        contentText,
      ),
      icon: Icon(
        chosenIcon,
        color: Color.fromARGB(255, 248, 247, 247),
      ),
    );
  }
}
