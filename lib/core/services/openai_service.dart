import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey;

  OpenAIService(this.apiKey);

  // Méthode pour appeler l'API ChatGPT
  Future<String> sendMessage(String userMessage) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    // Le body suit le format de l'API ChatGPT
    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": "Tu es un expert en mécanique automobile. Aide l'utilisateur."
        },
        {
          "role": "user",
          "content": userMessage
        }
      ]
    });

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final content = data["choices"][0]["message"]["content"];
      return content;
    } else {
      return "Erreur: ${response.statusCode} => ${response.body}";
    }
  }
}
