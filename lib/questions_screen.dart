import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = questions[1];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.questionText,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 254, 240),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(answers: currentQuestion.answers),
        ],
      ),
    );
  }
}
