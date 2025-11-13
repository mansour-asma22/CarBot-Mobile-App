import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';
import 'package:karhabti_pfe/view/widget/home/fraistextformfiled.dart';

import '../../../../controller/client/fraiscontroller.dart';
import '../../../../core/constant/color.dart';

// ignore: must_be_immutable
class Frais extends StatelessWidget {
   Frais({Key? key}) : super(key: key);
  FraisControllerImp controller = Get.put(FraisControllerImp());  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar : AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back , color: Colors.black),
    onPressed: () {
      Get.back(); 
    },
  ),
  centerTitle: true,
  title: Text("58".tr , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.bold , fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.white.withAlpha(0),
),
body: Container(
  margin: EdgeInsets.symmetric(horizontal: 15 ),
  child: Form(child: 
  ListView(
    children: [
      Image.asset("assets/images/frais2.png" , height: 200,),
      Text("59".tr , textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 15 , fontFamily: "Comfortaa"),),
      SizedBox(height: 40,),
      FraisTextFormFiled(
        mycontroller: controller.assurance,
        text: "60".tr),
      FraisTextFormFiled(mycontroller: controller.vignette,text: "61".tr),
      FraisTextFormFiled(mycontroller: controller.visite,text: "62".tr),
      SizedBox(height: 30,),
      // Bouton "Register" -> onPressed => controller.registerDates()
      Boutton(
        text: "63".tr,
        color: ColorApp.primaryColor,
        onPressed: () {
          controller.registerDates();
        },
      ),
    ],
  ),
  )
  ,)
    );
    
    
    
  }
}