import 'package:flutter/material.dart';
import 'api_service.dart'; // Import the API service to fetch trivia questions
import 'score_screen.dart'; // Import the score screen

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String question = 'Loading...';
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchTriviaQuestion(); // Fetch trivia question on screen load
  }

  Future<void> fetchTriviaQuestion() async {
    try {
      String triviaQuestion = await fetchTriviaQuestionFromAPI(); // Call the API
      setState(() {
        question = triviaQuestion;
      });
    } catch (e) {
      setState(() {
        question = 'Failed to load question';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trivia Question')),
      body: Center(
        child: Text(question),
      ),
    );
  }
}
