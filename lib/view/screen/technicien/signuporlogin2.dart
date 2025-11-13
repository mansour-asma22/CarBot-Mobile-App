import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';

import '../../../controller/technicien/signuporlogin2controller.dart';


class SignUpOrLogin2 extends StatelessWidget {
  const SignUpOrLogin2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpOrLogin2ControllerImp controller = Get.put(SignUpOrLogin2ControllerImp());
    return Scaffold(
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/background.jpeg" ),
      fit: BoxFit.fitHeight,
    ),
  ),
        child: SafeArea(
          child:
                 Column(
                   children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 203, 30),
            borderRadius: BorderRadius.circular(150),
                      ),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                     SizedBox(height: 120,),
                    Text("15".tr , style: TextStyle(fontSize: 25 , fontFamily: "Comfortaa", fontWeight: FontWeight.w800), textAlign: TextAlign.center,),
                    SizedBox(height: 15,),
                    Text("33".tr,
                    style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 17 , fontFamily: "Comfortaa"), textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 45,),
                     Column(
                       children: [
                         Boutton(
                          text: "13".tr,
                          color: Colors.white,
                          onPressed: (){
                            controller.goToLogin();
                          },
                          ),
                           Boutton(text: "14".tr, 
                            color: Colors.white,
                            onPressed: (){
                            controller.goToSignUp();
                            },
                            ),

                       ],
                     ),
                     
                   ],
                 )),
      ));
  }
}