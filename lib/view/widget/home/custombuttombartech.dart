import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/screen/areyou.dart';
import 'package:karhabti_pfe/view/widget/home/buttombartech.dart';
import '../../../controller/technicien/homescreentechcontroller.dart';

class CustomBottomBarTech extends GetView<HomeScreenTechControllerImp> {
  const CustomBottomBarTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              Row(
                children: [
                  ButtomBarTech(
        onPressed: (){
          controller.changePage(0);
        },
        icon: Icons.home,
        text: "home",
        active: controller.currentPage == 0? true : false,
      ),
                  ButtomBarTech(
        onPressed: (){
          controller.changePage(1);
        },
        icon: Icons.person,
        text: "profil",
        active: controller.currentPage == 1? true : false,
      ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  ButtomBarTech(
        onPressed: (){
          controller.changePage(2);
        },
        icon: Icons.message,
        text: "messagerie",
        active: controller.currentPage == 2? true : false,
      ),
                  ButtomBarTech(
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