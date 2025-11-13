
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp(); 
  goToForgetPassword(); 
}

class LoginControllerImp extends LoginController{
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
  late TextEditingController email ; 
  late TextEditingController password ; 
   bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }

  login(){
    var formdata = formstate.currentState;
    if (formdata!.validate()){
        print("valid");
    }else{
      print("not Valid");
    }
    Get.offAllNamed(AppRoute.homescreen);

  }
  
  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
  
  
}