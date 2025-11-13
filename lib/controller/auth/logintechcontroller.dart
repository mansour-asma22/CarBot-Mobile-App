
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class LoginTechController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword() ;
  
}

class LoginTechControllerImp extends LoginTechController{
  
 // GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
  late TextEditingController email ; 
  late TextEditingController password ; 
  bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }

  login(){
    //var formdata = formstate.currentState;
    //if (formdata!.validate()){
       // print("valid");
   // }else{
     // print("not Valid");
  //  }
    Get.offAllNamed(AppRoute.homescreentech);

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
    Get.toNamed(AppRoute.forgetPasswordtech);
  }
  
  
}