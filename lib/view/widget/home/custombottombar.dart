import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/homescreencontroller.dart';
import 'package:karhabti_pfe/view/screen/areyou.dart';

import 'buttombar.dart';

class CustomBottomBar extends GetView<HomeScreenControllerImp> {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              Row(
                children: [
                  ButtomBar(
        onPressed: (){
          controller.changePage(0);
        },
        icon: Icons.home,
        text: "46".tr,
        active: controller.currentPage == 0? true : false,
      ),
                  ButtomBar(
        onPressed: (){
          controller.changePage(1);
        },
        icon: Icons.person,
        text: "47".tr,
        active: controller.currentPage == 1? true : false,
      ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  ButtomBar(
        onPressed: (){
          controller.changePage(2);
        },
        icon: Icons.person,
        text: "48".tr,
        active: controller.currentPage == 2? true : false,
      ),
                  ButtomBar(
        onPressed: (){
          Get.offAll(AreYou());
        },
        icon: Icons.logout,
        text: "Log out", 
        active: null,
      ),
                ],
              ),


            ],
          )
        );
  }
}