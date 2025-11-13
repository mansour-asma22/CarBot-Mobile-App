import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/function/alertexitapp.dart';
import 'package:karhabti_pfe/view/widget/auth/customtextformauth.dart';
import '../../../../controller/auth/resetpasswordcontroller.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';
// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);
  ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                 body: WillPopScope(child: Container(
                        width: 500,
        padding: EdgeInsets.symmetric( horizontal: 25 , vertical: 10),
          decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/back2.jpeg" ),
      fit: BoxFit.fitHeight,
    ),
  ),
                  child: Form(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 80),
                          child: Image.asset("assets/images/verifycode.png" , height: 180, width: 50, alignment: Alignment.topLeft,)),
                          SizedBox(height: 30,),
                          CustomTextTiltleFormAuth(text :"Nouveau mot de passe"),
                        const SizedBox(height: 10,),
                          CustomTextBodyAuth(text: "Merci d'entrer votre nouveau mot de passe".tr),
                        SizedBox(height: 45,),
                        CustomTextFormAuth(hinttext: "Nouveau mot de passe", iconData: Icons.password_outlined , mycontroller: controller.password,),
                        const SizedBox(height: 10,),
                                      CustomButtomAuth(text: "Enregistrer".tr, onPressed :() {
               controller.goToSuccessResetPassword();
              }),
                      ],
                    ),
                  ),
                 ),
                 
                 onWillPop: alertExitApp)
                );
  }
}