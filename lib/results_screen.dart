import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

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
      body: Container(),
    );
  }
}
