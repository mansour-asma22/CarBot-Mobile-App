import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/data/pannescategories.dart';

enum Author { user, carbot }

class ChatMessage {
  final Author author;
  final String text;
  ChatMessage(this.author, this.text);
}

/// Contrôleur plus riche
class RobotController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var conversationEnded = false.obs;

  // Les questions en cours
  List<String> currentQuestions = [];
  PanneCategory? currentCategory;

  @override
  void onInit() {
    super.onInit();
    startConversation();
  }

  void startConversation() {
    messages.clear();
    conversationEnded.value = false;
    currentCategory = null;
    currentQuestions.clear();

    messages.add(ChatMessage(
      Author.carbot,
      "Bonjour, je suis CarBot.\nDécrivez-moi votre problème ou vos symptômes.",
    ));
  }

  /// Fuzzy matching: retourne true si la similarité est > 0.75 par ex
  bool fuzzyMatch(String input, String keyword) {
    final s1 = input.toLowerCase();
    final s2 = keyword.toLowerCase();
    final distance = levenshteinDistance(s1, s2);
    final maxLen = s1.length > s2.length ? s1.length : s2.length;
    final similarity = 1 - (distance / maxLen);
    return similarity > 0.75; // Seuil de tolérance
  }

  // Calcul de distance de Levenshtein
  int levenshteinDistance(String s1, String s2) {
    final len1 = s1.length;
    final len2 = s2.length;
    var dp = List.generate(len1 + 1, (_) => List<int>.filled(len2 + 1, 0));
    for (int i = 0; i <= len1; i++) {
      dp[i][0] = i;
    }
    for (int j = 0; j <= len2; j++) {
      dp[0][j] = j;
    }

    for (int i = 1; i <= len1; i++) {
      for (int j = 1; j <= len2; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] = 1 + [
            dp[i - 1][j],
            dp[i][j - 1],
            dp[i - 1][j - 1],
          ].reduce((a, b) => a < b ? a : b);
        }
      }
    }
    return dp[len1][len2];
  }

  /// Détecter la catégorie en cherchant dans pannesCategories
  PanneCategory? detectCategory(String userMsg) {
    final lower = userMsg.toLowerCase();
    // Pour chaque category
    for (var entry in pannesCategories.entries) {
      final cat = entry.value;
      // Cherche s’il y a un match (fuzzy) sur un de ses keywords
      for (var kw in cat.keywords) {
        // Soit on fait .contains(kw) ou on fait fuzzy
        if (lower.contains(kw.toLowerCase()) || fuzzyMatch(lower, kw)) {
          return cat;
        }
      }
    }
    return null;
  }

  /// Lancement de la suite
  void askNextQuestion() async {
    if (currentQuestions.isEmpty) {
      endConversation();
      return;
    }

    // On simule un petit "typing" du CarBot
    await addTypingDelay();
    final question = currentQuestions.removeAt(0);
    messages.add(ChatMessage(Author.carbot, question));
  }

  void endConversation() async {
    await addTypingDelay();
    if (currentCategory != null) {
      messages.add(ChatMessage(Author.carbot, currentCategory!.conclusion));
    } else {
      messages.add(ChatMessage(Author.carbot,
          "Je ne peux pas identifier la panne avec certitude.\nMerci de contacter un professionnel."));
    }
    conversationEnded.value = true;
  }

  /// Petit délai simulant CarBot qui "tape"
  Future<void> addTypingDelay() async {
    // Ajoute un message "CarBot is typing..."
    messages.add(ChatMessage(Author.carbot, "..."));
    await Future.delayed(Duration(milliseconds: 1000));
    // On enlève le dernier message si c'est "...".
    if (messages.isNotEmpty && messages.last.text == "...") {
      messages.removeLast();
    }
  }

  /// Quand user envoie un message
  Future<void> onUserMessage(String userInput) async {
    messages.add(ChatMessage(Author.user, userInput));

    if (conversationEnded.value) {
      // conversation terminée => on arrête
      await addTypingDelay();
      messages.add(ChatMessage(Author.carbot, "La conversation est terminée.\nRelancez si besoin."));
      return;
    }

    if (currentCategory == null) {
      // Détecter
      final cat = detectCategory(userInput);
      if (cat != null) {
        currentCategory = cat;
        currentQuestions = List.from(cat.questions);
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot, "Je suspecte un problème ${cat.name}."));
        if (currentQuestions.isEmpty) {
          endConversation();
        } else {
          askNextQuestion();
        }
      } else {
        // On ne sait pas
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot,
            "Pouvez-vous préciser davantage ? (Mots-clés: batterie, moteur, etc.)"));
      }
    } else {
      // On a la cat => on check oui/non/merci
      final lower = userInput.toLowerCase();
      if (lower.contains("oui")) {
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot, "D’accord, merci."));
        askNextQuestion();
      } else if (lower.contains("non")) {
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot, "Très bien."));
        askNextQuestion();
      } else if (lower.contains("merci")) {
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot, "Je vous en prie."));
        conversationEnded.value = true;
      } else {
        await addTypingDelay();
        messages.add(ChatMessage(Author.carbot, "Bien noté, continuons..."));
        askNextQuestion();
      }
    }
  }
}

/// =======================
/// UI : Vue "RobotScreen"
/// =======================
class RobotScreen extends StatelessWidget {
  RobotScreen({Key? key}) : super(key: key);

  final RobotController ctrl = Get.put(RobotController());
  final TextEditingController inputCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // On va mettre un gradient en fond
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              buildHeader(context),

              // Zone conversation
              Expanded(
                child: Obx(
                      () => ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(10),
                    itemCount: ctrl.messages.length,
                    itemBuilder: (context, index) {
                      final reverseIndex = ctrl.messages.length - 1 - index;
                      final msg = ctrl.messages[reverseIndex];
                      return buildBubble(msg);
                    },
                  ),
                ),
              ),

              // Champ de saisie
              Container(
                color: Colors.white.withOpacity(0.9),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: inputCtrl,
                        decoration: InputDecoration(
                          hintText: "Décrivez votre panne...",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () async {
                        final text = inputCtrl.text.trim();
                        if (text.isNotEmpty) {
                          await ctrl.onUserMessage(text);
                          inputCtrl.clear();
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 23,
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Un header plus AI-like
  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/robot.png"),
            radius: 20,
          ),
          SizedBox(width: 10),
          Text(
            "Support Technique IA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Comfortaa",
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Bulle de chat
  Widget buildBubble(ChatMessage msg) {
    bool isUser = (msg.author == Author.user);

    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
        left: isUser ? 60 : 10,
        right: isUser ? 10 : 60,
      ),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Avatar
          if (!isUser)
            CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/robot.png"),
            )
          else
            CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/profil.png"),
            ),
          SizedBox(height: 5),
          // Bulle
          Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(maxWidth: 270),
            decoration: BoxDecoration(
              color: isUser ? Colors.blueAccent : Colors.orange[100],
              borderRadius: BorderRadius.only(
                topLeft: isUser ? Radius.circular(12) : Radius.circular(4),
                topRight: isUser ? Radius.circular(4) : Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              msg.text,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
