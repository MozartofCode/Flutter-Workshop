import 'package:flutter/material.dart';
import 'question_screen.dart'; // Import the question screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trivia Game')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionScreen()),
            );
          },
          child: Text('Start Game'),
        ),
      ),
    );
  }
}
