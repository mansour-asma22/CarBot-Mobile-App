import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/color.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
    title: "attention",
    titleStyle: TextStyle(fontFamily: "Comfortaa" , fontWeight: FontWeight.w900),
    middleText: "Voulez-vous quitter" ,
    middleTextStyle: TextStyle(fontFamily: "Comfortaa" , fontWeight: FontWeight.w700),
    actions: [
      Boutton(text: "Oui", color: Colors.white , onPressed: (){exit(0);}, ),
     Boutton(text: "Non", color: ColorApp.primaryColor, onPressed: (){Get.back();},)
    ]
  );
  return Future.value(true);
}