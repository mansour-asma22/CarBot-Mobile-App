import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/technicien/homescreentechcontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/home/custombuttombartech.dart';

class HomeTechScreen extends StatelessWidget {
  const HomeTechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenTechControllerImp());
    return  GetBuilder<HomeScreenTechControllerImp>
    (builder: (controller) =>
    Scaffold(
      floatingActionButton:  FloatingActionButton(
        backgroundColor: ColorApp.primaryColor,
        onPressed:(){
          controller.changePage(3);
        } ,
        child: Icon(Icons.notifications ,) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:CustomBottomBarTech(),
     body: controller.listPage.elementAt(controller.currentPage),),
     );
  }
}