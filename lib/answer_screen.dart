import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key, required this.currentQuestion});
  final QuizQuestion currentQuestion;
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  bool isChosen = false;
  void isPressed() {
    setState(() {
      isChosen = !isChosen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.currentQuestion.questionText),
        ...widget.currentQuestion.answers.map(
          (answer) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              backgroundColor: isChosen
                  ? Color.fromARGB(255, 107, 15, 168)
                  : Color.fromARGB(255, 255, 254, 240),
              foregroundColor: isChosen
                  ? Color.fromARGB(255, 255, 254, 240)
                  : Color.fromARGB(255, 0, 0, 0),
            ),

            onPressed: isPressed,
            child: Text(answer),
          ),
        ),
      ],
    );
  }
}
