import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answers_widget.dart';
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
  int _currentQuestionIndex = 0;
  QuizQuestion _currentQuestion = questions[0];
  List<int?> selectedAnswers = List.filled(questions.length, null);
  final Map<int, List<String>> shuffledAnswers = {};

  @override
  void initState() {
    super.initState();

    _currentQuestion = questions[_currentQuestionIndex];
  }

  List<String> getShuffledAnswers(int questionIndex, List<String> answers) {
    if (!shuffledAnswers.containsKey(questionIndex)) {
      final shuffled = List<String>.from(answers)..shuffle();
      shuffledAnswers[questionIndex] = shuffled;
    }
    return shuffledAnswers[questionIndex]!;
  }

  void isPressed(String page) {
    setState(() {
      page == 'next' ? _currentQuestionIndex += 1 : _currentQuestionIndex -= 1;

      _currentQuestion = questions[_currentQuestionIndex];
    });
  }

  void addAnswer(int answerIndex) {
    setState(() {
      selectedAnswers[_currentQuestionIndex] = answerIndex;
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
                _currentQuestion.questionText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 254, 240),
                  fontSize: 18,
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
                  _currentQuestionIndex,
                  _currentQuestion.answers,
                ),
                selectedAnswers: selectedAnswers,
                addAnswer: addAnswer,
                currentQuestionIndex: _currentQuestionIndex,
              ),
            ),
            const SizedBox(height: 24),
            // Navigation
            QuestionNav(
              currentQuesitionIndex: _currentQuestionIndex,
              previous: previous,
              next: next,
              isPressed: isPressed,
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
