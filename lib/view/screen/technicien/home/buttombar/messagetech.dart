import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conversationtech.dart';


class MessagesTech extends StatelessWidget {
  const MessagesTech({Key? key}) : super(key: key);

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
  title: Text("Mes Conversations", style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w900 , fontSize: 18),),
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
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/profil.png" , height: 40, width: 40,),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text("Bayrem Tolier" , style: TextStyle(fontSize: 16 , fontFamily: "Comfortaa" , fontWeight: FontWeight.w600),),
                          Spacer(),
                          Text("hello"),
                        ],
                      ),

                    ],
                  ),
              ),
              
              onTap: (){
               Get.to(ChatTechPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}