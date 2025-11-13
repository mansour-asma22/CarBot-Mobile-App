import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/auth/resetpasswordcontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/boutton.dart';

// ignore: must_be_immutable
class SuccessResetPassword extends StatelessWidget {
   SuccessResetPassword({Key? key}) : super(key: key);
  ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());

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
                 Text("Votre mot de passe est changé avec succés" , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.w900 , fontSize: 25) , textAlign: TextAlign.center,),
                 SizedBox(height: 50,),
                 Boutton(text: "Suivant", onPressed: (){controller.goToHome();} , color: ColorApp.primaryColor,)
               ],
             ),
      ),
    );
  }
}