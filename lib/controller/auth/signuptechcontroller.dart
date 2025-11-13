
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class SignUpTechController extends GetxController{
  SignUp();
  goToSignUp();
  goToHomePageTech();
  gotosuccesssignup();
}

class SignUpTechControllerImp extends SignUpTechController{
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username ; 
  late TextEditingController phone ; 
  late TextEditingController email ; 
  late TextEditingController password ; 
  late TextEditingController password2 ; 
   var selectedOption = "mécanicien".obs;
    bool isshowpassword = true ;
   showPassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
   }

  
   

  SignUp(){
    //var formdata = formstate.currentState;
    //if (formdata!.validate()){
      //  print("valid");
   // }else{
     // print("not Valid");
    //}
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
  goToHomePageTech() {
    Get.offAllNamed(AppRoute.homescreentech);
  }
  void updateSelectedOption(String newOption) {
    
    selectedOption.value = newOption;
  }
  
  @override
  gotosuccesssignup() {
    Get.offAllNamed(AppRoute.successSignUptech);
  }
}