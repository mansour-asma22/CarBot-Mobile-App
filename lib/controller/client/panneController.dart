import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class PanneController extends GetxController {
  void goToLoc(String serviceTerm);
}

class PanneControllerImp extends PanneController {
  @override
  void goToLoc(String serviceTerm) {
    // On navigue vers Localisezvous en passant l'argument
    // "serviceTerm" (par exemple "mécanicien")
    Get.toNamed(AppRoute.loc, arguments: serviceTerm);
  }
}
