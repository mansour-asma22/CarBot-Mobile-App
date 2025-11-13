import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController{

  checkecode();
  
  goToResetPassword();
  goToResetPasswordTech();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  
   void verifyCode(String enteredCode, String sentCode) {
    if (enteredCode == sentCode) {
      // Le code est correct, effectuez l'action souhaitée
      // Par exemple, naviguez vers la réinitialisation du mot de passe
      goToResetPassword();
    } else {
      // Le code est incorrect, affichez un message d'erreur
      Get.dialog(
        AlertDialog(
          title: Text("Erreur de vérification"),
          content: Text("Le code entré est incorrect."),
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  
  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }
  
  @override
  checkecode() {}
  
  @override
  goToResetPasswordTech() {
    Get.toNamed(AppRoute.resetPasswordtech);
  }
}