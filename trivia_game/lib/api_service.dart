import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchTriviaQuestionFromAPI() async {
  final apiKey = ''; // Replace with your OpenAI API key
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');

  var body = jsonEncode({
    "model": "gpt-4",
    "messages": [
      {"role": "system", "content": "You are a trivia generator."},
      {"role": "user", "content": "Give me a trivia question with multiple choices."}
    ],
    "max_tokens": 150,
  });

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: body,
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var question = data['choices'][0]['message']['content'];
    return question;
  } else {
    throw Exception('Failed to load trivia question');
  }
}
