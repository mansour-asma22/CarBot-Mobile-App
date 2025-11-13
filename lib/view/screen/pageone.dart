import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/screen/areyou.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 3), () {
      Get.off(AreYou());
    });
    return Scaffold(
      body:Container(
        color: Color.fromARGB(255, 255, 203, 30),
        height: 900,
        width: 500,
        child: Center(
          child: Image.asset("assets/images/logo.png" ,
           fit: BoxFit.cover , 
           width: 250,
            height: 250,)),
      ),
      
    );
  }
}





