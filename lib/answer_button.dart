import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answers});

  final List<String> answers;

  List<Widget> buildAnswers(List<String> answers) {
    List<Widget> answerButtons = [];
    for (var i = 0; i < answers.length; i++) {
      answerButtons.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(answers[i]),
          onPressed: () {},
        ),
      );
    }
    return answerButtons;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 5.0,
        children: buildAnswers(answers),
      ),
    );
  }
}
