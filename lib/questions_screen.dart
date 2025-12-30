import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_screen.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';
import 'package:flutter_quiz_app/questions_nav.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final IconData next = Icons.arrow_right_outlined;
  final IconData previous = Icons.arrow_left_outlined;
  int _currentQuesitionIndex = 0;
  QuizQuestion _currentQuestion = questions[0];
  @override
  void initState() {
    super.initState();

    _currentQuestion = questions[_currentQuesitionIndex];
  }

  void isPressed(String page) {
    page == 'next' ? _currentQuesitionIndex += 1 : _currentQuesitionIndex -= 1;

    setState(() {
      _currentQuestion = questions[_currentQuesitionIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              _currentQuestion.questionText,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 254, 240),
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AnswerScreen(answers: _currentQuestion.answers),

            const SizedBox(
              height: 30,
            ),
          ],
        ),

        QuestionNav(
          currentQuesitionIndex: _currentQuesitionIndex,
          previous: previous,
          next: next,
          isPressed: isPressed,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
