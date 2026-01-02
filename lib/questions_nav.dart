import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/quiz_button.dart';

class QuestionNav extends StatelessWidget {
  const QuestionNav({
    super.key,
    required int currentQuesitionIndex,
    required this.previous,
    required this.next,
    required this.isPressed,
  }) : _currentQuesitionIndex = currentQuesitionIndex;

  final int _currentQuesitionIndex;
  final IconData previous;
  final IconData next;
  final Function(String) isPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_currentQuesitionIndex > 0 &&
            _currentQuesitionIndex <= questions.length)
          QuizButton(
            contentText: 'Previous',
            switchScreen: isPressed,
            chosenIcon: previous,
            page: 'prev',
          ),
        SizedBox(
          width: 50,
        ),

        if (_currentQuesitionIndex >= 0 &&
            _currentQuesitionIndex < questions.length - 1)
          QuizButton(
            contentText: 'Next',
            switchScreen: isPressed,
            chosenIcon: next,
            page: 'next',
          ),
      ],
    );
  }
}
