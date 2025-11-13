
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class SignUpController extends GetxController{
  var isBlur = false.obs;

  SignUp();
  
  gotosuccesssignup();
  goToHome();
}

class SignUpControllerImp extends SignUpController{
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username ; 
  late TextEditingController phone ; 
  late TextEditingController email ; 
  late TextEditingController password ; 
  late TextEditingController password2 ; 
  bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }
   

  SignUp(){
    var formdata = formstate.currentState;
    if (formdata!.validate()){
        print("valid");
    }else{
      print("not Valid");
    }Get.toNamed(AppRoute.signup);
    
  }
  


  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    password2.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
  
  @override
  gotosuccesssignup() {
    Get.offAllNamed(AppRoute.successSignUp);
  }
  
  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homescreen);
}
}