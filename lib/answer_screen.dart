import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key, required this.answers});
  final List<String> answers;
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.answers.length, (index) {
        final isSelected = index == selectedIndex;
        return ElevatedButton(
          onPressed: () {
            setState(() {
              selectedIndex = index;
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(330, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            backgroundColor: isSelected
                ? Color.fromARGB(255, 78, 13, 151)
                : Color.fromARGB(255, 107, 15, 168),
            foregroundColor: isSelected
                ? Color.fromARGB(255, 223, 247, 7)
                : Color.fromARGB(255, 251, 250, 252),
            //padding: EdgeInsets.all(2),
            alignment: Alignment.centerLeft,
          ),
          child: Text(widget.answers[index]),
        );
      }),
    );
  }
}
