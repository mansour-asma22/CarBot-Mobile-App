import 'dart:math';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController{
 
  checkemail();
  
  goToVerifyCode();
  goToVerifyCodetech();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
   void sendVerificationCode(String email, String verificationCode) async {
    final MailOptions mailOptions = MailOptions(
      body: 'Votre code de vérification : $verificationCode',
      subject: 'Code de vérification',
      recipients: [email],
      isHTML: false,
    );

    await FlutterMailer.send(mailOptions);
  }
  String generateVerificationCode() {
  Random random = Random();
  int code = random.nextInt(9000) + 1000;
  return code.toString();
}


  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email ; 
 
  bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }
  


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  @override
  goToVerifyCode() {
    Get.toNamed(AppRoute.verifycode);
  }
  
  @override
  checkemail() {}
  
  @override
  goToVerifyCodetech() {
    Get.toNamed(AppRoute.verifycodetech);
  }
}