import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/function/alertexitapp.dart';
import '../../../../controller/auth/verifycodecontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// ignore: must_be_immutable
class VerifyCode extends StatelessWidget {
   VerifyCode({Key? key}) : super(key: key);

 VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
                          child: Image.asset("assets/images/forgetpassword.png" , height: 180, width: 50, alignment: Alignment.topLeft,)),
          CustomTextTiltleFormAuth(text :"Vérification du Code"),
         const SizedBox(height: 30,),
          CustomTextBodyAuth(text: "Nous avons vous envoyé un code par mail. Merci d'entrer le code".tr),
           const SizedBox(height: 50,),
         OtpTextField(
          focusedBorderColor: Colors.black,
          cursorColor: ColorApp.primaryColor,
          margin: EdgeInsets.only(right: 20),
          enabledBorderColor:Color.fromARGB(255, 200, 182, 182),
          borderRadius: BorderRadius.circular(20),
          fieldWidth: 50,
        numberOfFields: 4,
        showFieldAsBox: true, 
        onCodeChanged: (String code) {
          controller.goToResetPassword();
        },
        onSubmit: (String verificationCode){
          String sentCode = "1234"; 
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Le code entré est $verificationCode'),
                );
                }
                // Remplacez par le code envoyé par e-mail
            );
                controller.verifyCode(verificationCode, sentCode);

        }, // end onSubmit
    ),
                      ],
                    ),
                  ),
                 ),
                 onWillPop: alertExitApp)
                );
  }
}