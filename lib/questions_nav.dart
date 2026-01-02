import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/quiz_button.dart';

class QuestionNav extends StatelessWidget {
  const QuestionNav({
    super.key,
    required int currentQuesitionIndex,
    required this.isPressed,
  }) : _currentQuesitionIndex = currentQuesitionIndex;

  final int _currentQuesitionIndex;
  final Function(String) isPressed;

  @override
  Widget build(BuildContext context) {
    final IconData next = Icons.arrow_right_outlined;
    final IconData previous = Icons.arrow_left_outlined;
    final IconData results = Icons.grading_sharp;

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
        if (_currentQuesitionIndex == questions.length - 1)
          QuizButton(
            contentText: 'Results',
            switchScreen: isPressed,
            chosenIcon: results,
            page: 'results-screen',
          ),
      ],
    );
  }
}
