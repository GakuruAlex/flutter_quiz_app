import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';

class AnswerScreen extends StatefulWidget {
  AnswerScreen({super.key, required this.currentQuestion});
  final QuizQuestion currentQuestion;
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  final bool isPressed = false;

  Widget build(BuildContext context) {
    return Column();
  }
}
