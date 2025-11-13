import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/auth/forgetpasswordcontroller.dart';
import 'package:karhabti_pfe/core/function/alertexitapp.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';
// ignore: must_be_immutable
class ForgetPasswordTech extends StatelessWidget {
   ForgetPasswordTech({Key? key}) : super(key: key);

 ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
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
                  key: controller.formstate,
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 80),
                          child: Image.asset("assets/images/forgetpassword.png" , height: 180, width: 50, alignment: Alignment.topLeft,)),
          CustomTextTiltleFormAuth(text :"vérifier l'e-mail"),
         const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "Entrer votre adresse e-mail pour recevoir un code ".tr),
        SizedBox(height: 45,),
          CustomTextFormAuth(
           //  valid:(val){
            //  return ValidInput(val!, 8,30, "email");
           // },
          mycontroller: controller.email,
          hinttext: "16".tr,
          iconData: Icons.email_outlined,
         ),
         const SizedBox(height: 10,),
                       CustomButtomAuth(text: "Verifier".tr, onPressed :() {
                controller.goToVerifyCodetech();
                 
              }),

                    
                      ],
                    ),
                  ),
                 ),
                 
                 onWillPop: alertExitApp)
                );
  }
}