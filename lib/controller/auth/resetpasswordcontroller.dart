
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController{
  var isBlur = false.obs;



  resetpassword();
  
  goToSuccessResetPassword();
  goToSuccessResetPasswordTech();
  goToHome();
  goToHomeTech();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password ; 
 
  bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }
  


  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
  
  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successresetPassword);
  }
  
  @override
  resetpassword() {}
  
  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homescreen);
  }
  
  @override
  goToHomeTech() {
    Get.offAllNamed(AppRoute.homescreentech);
  }
  
  @override
  goToSuccessResetPasswordTech() {
    Get.offAllNamed(AppRoute.successresetPasswordTech);
  }
}