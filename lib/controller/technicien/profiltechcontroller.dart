import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class ProfilTechController extends GetxController{
  gotoEditTechProfil();
  goToAnnonces();
  goToAddress();
}
class ProfilTechControllerImp extends ProfilTechController{
  @override
  gotoEditTechProfil() {
    Get.toNamed(AppRoute.edittechprofil);
  }
  
  @override
  goToAnnonces() {
    Get.toNamed(AppRoute.annonces);
  }
  
  @override
  goToAddress() {
    Get.toNamed(AppRoute.adresse);
  }



}