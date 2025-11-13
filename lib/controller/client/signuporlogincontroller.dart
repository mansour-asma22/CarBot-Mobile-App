import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class SignUpOrLoginController extends GetxController{
  goToSignUp();
  goToLogin(); 
  
}
class  SignUpOrLoginControllerImp extends  SignUpOrLoginController{
  @override
  goToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  goToSignUp() {
  
    Get.toNamed(AppRoute.signup);
  }

}