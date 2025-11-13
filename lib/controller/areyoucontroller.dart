import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class AreYouController extends GetxController{
  goToOnBoarding();
  goToOnBoarding2(); 
}
class  AreYouControllerImp extends  AreYouController{
  @override
  goToOnBoarding() {
    Get.toNamed(AppRoute.onBoarding);
  }

  @override
  goToOnBoarding2() {
    Get.toNamed(AppRoute.onBoarding2) ;
  }


}