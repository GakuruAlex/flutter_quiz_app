import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(206, 49, 2, 116),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                height: 300,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Learn Flutter The Fun Way!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed!');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.deepPurpleAccent,
                  ),
                ),
                child: Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
