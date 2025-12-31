import 'package:flutter/material.dart';

class AnswersScreen extends StatefulWidget {
  const AnswersScreen({
    super.key,
    required this.selectedAnswers,
    required this.answers,
    required this.addAnswer,
    required this.currentQuestionIndex,
  });
  final List<String> answers;
  final List<int?> selectedAnswers;
  final Function addAnswer;
  final int currentQuestionIndex;

  @override
  State<AnswersScreen> createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    selectedAnswer = widget.selectedAnswers[widget.currentQuestionIndex];

    return ListView.separated(
      itemCount: widget.answers.length,
      separatorBuilder: (_, _) => const SizedBox(height: 5),
      itemBuilder: (_, index) {
        return ElevatedButton(
          onPressed: () {
            widget.addAnswer(index);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            backgroundColor: selectedAnswer == index
                ? const Color.fromARGB(255, 52, 3, 107)
                : const Color.fromARGB(255, 107, 15, 168),
            foregroundColor: selectedAnswer == index
                ? const Color.fromARGB(255, 250, 247, 247)
                : const Color.fromARGB(255, 251, 250, 252),
            alignment: Alignment.centerLeft,
          ),
          child: Text(widget.answers[index]),
        );
      },
    );
  }
}
