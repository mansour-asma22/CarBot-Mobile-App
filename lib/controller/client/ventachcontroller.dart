import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

abstract class VentAchCotroller extends GetxController{
 goToPostulation();
}

class VentAchCotrollerImp extends VentAchCotroller{
  @override
  goToPostulation() {
    Get.toNamed(AppRoute.post);
  }

}