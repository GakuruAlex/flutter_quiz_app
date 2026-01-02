import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answers_widget.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';
import 'package:flutter_quiz_app/questions_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.switchScreen,
    required this.selectedAnswers,
    required this.shuffledAnswers,
    required this.currentQuestionIndex,
    required this.currentQuestion,
  });
  final void Function(String) switchScreen;
  final List<String> selectedAnswers;
  final Map<int, List<String>> shuffledAnswers;
  final int currentQuestionIndex;
  final QuizQuestion currentQuestion;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> getShuffledAnswers(int questionIndex, List<String> answers) {
    if (!widget.shuffledAnswers.containsKey(questionIndex)) {
      final shuffled = List<String>.from(answers)..shuffle();
      widget.shuffledAnswers[questionIndex] = shuffled;
    }
    return widget.shuffledAnswers[questionIndex]!;
  }

  void addAnswer(int answerIndex) {
    setState(() {
      widget.selectedAnswers[widget.currentQuestionIndex] =
          widget.shuffledAnswers[widget.currentQuestionIndex]![answerIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 13, 151),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max, // important
          children: [
            // Question text
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.currentQuestion.questionText,
                style: GoogleFonts.notoSansDisplay(
                  color: Color.fromARGB(255, 255, 254, 240),
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            // Answers list (this gets the space)
            SizedBox(
              height: 250,
              child: AnswersScreen(
                answers: getShuffledAnswers(
                  widget.currentQuestionIndex,
                  widget.currentQuestion.answers,
                ),
                selectedAnswers: widget.selectedAnswers,
                addAnswer: addAnswer,
                currentQuestionIndex: widget.currentQuestionIndex,
              ),
            ),
            const SizedBox(height: 24),
            // Navigation
            QuestionNav(
              currentQuesitionIndex: widget.currentQuestionIndex,
              isPressed: widget.switchScreen,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
