import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  final TextStyle questionsFont = GoogleFonts.notoSansDisplay(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 18,
  );

  final TextStyle userAnswersFont = GoogleFonts.notoSansDisplay(
    color: Color.fromARGB(255, 217, 6, 245),
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
        ),
      ),

      child: Center(
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.right,
          controller: ScrollController(initialScrollOffset: 0.0),
          child: SizedBox(
            width: 375,
            height: 500,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    QuestionText(
                      selectedAnswers: selectedAnswers,
                      index: index,
                      questionsFont: questionsFont,
                    ),

                    ResultText(
                      selectedAnswers: selectedAnswers,
                      index: index,
                      userAnswersFont: userAnswersFont,
                    ),
                    CorrectAnswer(
                      index: index,
                      userAnswersFont: userAnswersFont,
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 30.0,
                  ),
              itemCount: questions.length,
            ),
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    super.key,
    required this.index,
    required this.userAnswersFont,
  });
  final int index;

  final TextStyle userAnswersFont;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          questions[index].answers[0],
          style: userAnswersFont,
        ),
      ],
    );
  }
}

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.index,
    required this.selectedAnswers,
    required this.questionsFont,
  });
  final int index;
  final List<String> selectedAnswers;

  final TextStyle questionsFont;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Question number widget
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: questions[index].answers[0] == selectedAnswers[index]
                ? Color.fromARGB(255, 153, 241, 142)
                : Color.fromRGBO(247, 149, 149, 1),
          ),

          child: Text(
            '${index + 1}',
            style: questionsFont,
          ),
        ),

        // Question text widget
        Expanded(
          child: Text(
            questions[index].questionText,
            style: questionsFont,
          ),
        ),
      ],
    );
  }
}

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.selectedAnswers,
    required this.index,
    required this.userAnswersFont,
  });

  final List<String> selectedAnswers;
  final int index;

  final TextStyle userAnswersFont;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(selectedAnswers[index], style: userAnswersFont),
      ],
    );
  }
}
