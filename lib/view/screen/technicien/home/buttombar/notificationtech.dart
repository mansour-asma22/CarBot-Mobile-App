import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTech extends StatelessWidget {
  const NotificationTech({Key? key}) : super(key: key);

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
  title: Text("Mes notifications", style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w900 , fontSize: 18),),
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
        
      ),
    );
  }
}