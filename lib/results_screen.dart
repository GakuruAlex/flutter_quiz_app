import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 13, 151),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 107, 15, 168),
        title: Text(
          'Flutter Quiz Results',
          style: GoogleFonts.notoSansDisplay(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Scrollbar(
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
                const Divider(
                  height: 30.0,
                ),
            itemCount: questions.length,
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          questions[index].answers[0],
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 255, 255, 255),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Question number widget
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: questions[index].answers[0] == selectedAnswers[index]
                ? Color.fromARGB(255, 107, 247, 88)
                : Color.fromRGBO(247, 149, 149, 1),
          ),
          padding: EdgeInsets.all(4),

          child: Text(
            '${index + 1}.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),

        // Question text widget
        Expanded(
          child: Text(
            questions[index].questionText,
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 255, 255, 255),
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
        Text(
          selectedAnswers[index],
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    );
  }
}
