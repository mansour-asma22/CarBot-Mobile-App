import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});
}

class ChatController extends GetxController {
  final messages = <ChatMessage>[].obs;

  void sendMessage(String message) {
    messages.add(ChatMessage(message: message, isMe: true));
  }
}

class ChatPage extends StatelessWidget {
  final _controller = Get.put(ChatController());

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back , color: Colors.black),
    onPressed: () {
      Get.back(); 
    },
  ),
  centerTitle: true,
  elevation: 0,
  title: Row(
    children: [
      Image.asset("assets/images/profil.png" , height: 40, width: 50,),
      SizedBox(width: 10,),
      Text("Bayrem tolier", style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w900 , fontSize: 18),),
    ],
  ),
  backgroundColor: Colors.white.withOpacity(0),
),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundmsg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: _controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = _controller.messages[index];
                      return ListTile(
                        title: Container(
                          margin: message.isMe ? EdgeInsets.only(bottom: 10 , left: 10) : EdgeInsets.only(bottom: 10 , right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20) ,
                            color: Colors.white,
                            ),
                          width: double.infinity,
                          child: Text(message.message)),
                          trailing: message.isMe ? Image.asset("assets/images/profil.png" , height: 30,) : null,
                      );
                    },
                  )),
            ),
            Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 2), // décalage vers le bas de l'ombre
      ),
    ],
  ),
  padding: const EdgeInsets.all(10),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'Saisissez un message...',
            border: InputBorder.none, // suppression de la bordure du TextField
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.send , color: Colors.amber,),
        onPressed: () {
          _controller.sendMessage(_textEditingController.text);
          _textEditingController.clear();
        },
      ),
    ],
  ),
)

          ],
        ),
      ),
    );
  }
}
