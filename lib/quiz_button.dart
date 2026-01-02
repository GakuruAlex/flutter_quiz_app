import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.contentText,
    required this.switchScreen,
    required this.chosenIcon,
    required this.page,
  });
  final String contentText;
  final void Function(String) switchScreen;
  final IconData chosenIcon;
  final String page;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        switchScreen(page);
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 253, 252, 252),
        iconAlignment: IconAlignment.end,
        fixedSize: Size(140, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),

      label: Text(
        contentText,
        style: GoogleFonts.notoSansDisplay(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 18.0,
        ),
      ),
      icon: Icon(
        chosenIcon,
        color: Color.fromARGB(255, 248, 247, 247),
      ),
    );
  }
}
