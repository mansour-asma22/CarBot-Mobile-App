import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/widget/home/custombottombar.dart';

import '../../../../../../controller/client/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return  GetBuilder<HomeScreenControllerImp>
    (builder: (controller) =>
    Scaffold(
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 203, 30),
        onPressed:(){
          controller.changePage(3);
        } ,
        child: Icon(Icons.notifications ,) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:CustomBottomBar(),
     body: controller.listPage.elementAt(controller.currentPage),),
     );
  }
}