import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswersScreen extends StatefulWidget {
  const AnswersScreen({
    super.key,
    required this.selectedAnswers,
    required this.answers,
    required this.addAnswer,
    required this.currentQuestionIndex,
  });
  final List<String> answers;
  final List<String> selectedAnswers;
  final Function addAnswer;
  final int currentQuestionIndex;

  @override
  State<AnswersScreen> createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    selectedAnswer = widget.selectedAnswers[widget.currentQuestionIndex];

    return ListView.separated(
      itemCount: widget.answers.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        return ElevatedButton(
          onPressed: () {
            widget.addAnswer(index);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(30),
            ),
            backgroundColor: selectedAnswer == widget.answers[index]
                ? const Color.fromARGB(255, 136, 48, 236)
                : const Color.fromARGB(255, 42, 4, 117),
            foregroundColor: selectedAnswer == widget.answers[index]
                ? const Color.fromARGB(255, 250, 247, 247)
                : const Color.fromARGB(255, 251, 250, 252),
            alignment: Alignment.centerLeft,
          ),
          child: Text(
            widget.answers[index],
            style: GoogleFonts.notoSansDisplay(fontSize: 17.0),
          ),
        );
      },
    );
  }
}
