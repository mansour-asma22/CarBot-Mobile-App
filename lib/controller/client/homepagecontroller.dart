import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class HomePageController extends GetxController{
goToPanne();
goToVenteAchat();
goToFrais();
goToLoc();

}
class  HomePageControllerImp extends  HomePageController {

  @override
  goToPanne() {
    Get.toNamed(AppRoute.panne);
  }
  
  @override
  goToVenteAchat() {
    Get.toNamed(AppRoute.venteachat);
  }
  
  @override
  goToFrais() {
    Get.toNamed(AppRoute.frais);
  }
  
  void gotolist(String t) {
      Get.toNamed(AppRoute.liste);
  }
  
  @override
  goToLoc() {
    Get.toNamed(AppRoute.adresse);
  }
  
  
  
 
  


}