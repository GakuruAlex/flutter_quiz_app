import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.score,
  });

  final List<String> selectedAnswers;

  final int score;

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

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "You got $score right of ${questions.length} right!",
                style: GoogleFonts.notoSansDisplay(
                  color: Color.fromRGBO(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
              controller: ScrollController(initialScrollOffset: 0.0),
              child: SizedBox(
                width: 375,
                height: 400,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        QuestionText(
                          selectedAnswers: selectedAnswers,
                          index: index,
                        ),

                        ResultText(
                          selectedAnswers: selectedAnswers,
                          index: index,
                        ),
                        CorrectAnswer(
                          index: index,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 4.0,
                      ),
                  itemCount: questions.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            questions[index].answers[0],
            style: GoogleFonts.notoSansDisplay(
              fontSize: 17,
              color: Color.fromARGB(255, 42, 247, 160),
            ),
          ),
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
  });
  final int index;
  final List<String> selectedAnswers;

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
                ? Color.fromARGB(255, 42, 247, 200)
                : Color.fromRGBO(247, 149, 149, 127),
          ),

          child: Text(
            '${index + 1}',
            style: GoogleFonts.notoSansDisplay(
              color: Color.fromRGBO(8, 8, 8, 1),
            ),
          ),
        ),

        // Question text widget
        Expanded(
          child: Text(
            questions[index].questionText,
            style: GoogleFonts.notoSansDisplay(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,
            ),
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
  });

  final List<String> selectedAnswers;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            selectedAnswers[index],
            style: GoogleFonts.notoSansDisplay(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 183, 71, 248),
            ),
          ),
        ),
      ],
    );
  }
}
