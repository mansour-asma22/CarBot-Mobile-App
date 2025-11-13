import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class SignUpOrLogin2Controller extends GetxController{
  goToSignUp();
  goToLogin(); 
  
}
class  SignUpOrLogin2ControllerImp extends  SignUpOrLogin2Controller{
  @override
  goToLogin() {
    Get.toNamed(AppRoute.logintech);
  }

  @override
  goToSignUp() {
  
    Get.toNamed(AppRoute.signuptech);
  }

}