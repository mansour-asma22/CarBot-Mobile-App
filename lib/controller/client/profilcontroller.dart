import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class ProfilController extends GetxController{
  goToRendezVous();
  goToAnnonces();

}
class ProfilControllerImp extends ProfilController{

  @override
  goToRendezVous() {
    Get.toNamed(AppRoute.rendezvous);
  }
  
  @override
  goToAnnonces() {
    Get.toNamed(AppRoute.annonces);
  }

}
