import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';
import 'package:karhabti_pfe/data/datasource/static/static.dart';


abstract class OnBoarding2Controller extends GetxController{
  nextt();
  skipp();
  onPageChangedd(int index);
  
}
class OnBoarding2ControllerImp extends OnBoarding2Controller{

  late PageController page2Controller ;
  int currenttPage = 0;
  
  @override
  nextt() {
    currenttPage++;
    if(currenttPage> onBoardingList1.length -1){
      Get.offAllNamed(AppRoute.signuporlogin2);
    }else{
    page2Controller.animateToPage(currenttPage, duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChangedd(int index) {
     currenttPage = index;
     update();
  }

  @override
  void onInit() {
    page2Controller = PageController();
    super.onInit();
  }
  
  @override
  skipp() {
    Get.offAllNamed(AppRoute.signuporlogin2);
  }
}  

  



