import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';
import 'package:karhabti_pfe/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
  
}
class OnBoardingControllerImp extends OnBoardingController{
  late PageController pageController ;
  int currentPage = 0;
  
  @override
  next() {
    currentPage++;
    if(currentPage> onBoardingList.length -1){
      Get.offAllNamed(AppRoute.signuporlogin);
    }else{
    pageController.animateToPage(currentPage, duration: const Duration(microseconds: 900), curve: Curves.easeInOut);

    }

  }

  @override
  onPageChanged(int index) {
     currentPage = index;
     update();
  }

  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }


}