import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signuptechcontroller.dart';
import '../../../core/constant/color.dart';
import '../../widget/boutton.dart';

// ignore: must_be_immutable
class SuccessSignUpTech extends StatelessWidget {
   SuccessSignUpTech({Key? key}) : super(key: key);
  SignUpTechControllerImp controller = Get.put(SignUpTechControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset("assets/images/success.png"),
                 SizedBox(height: 20,),
                 Text("34".tr , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w900 , fontSize: 25) , textAlign: TextAlign.center,),
                 SizedBox(height: 15,),
                 Text("35".tr , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w700 , fontSize: 20) , textAlign: TextAlign.center,),

                 SizedBox(height: 50,),
                 Boutton(text: "9".tr, onPressed: (){controller.goToHomePageTech();} , color: ColorApp.primaryColor,)
               ],
             ),
      ),
    );
  }
}