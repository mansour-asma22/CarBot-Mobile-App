import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/messages.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/notification.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/profil/profil.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/homepage.dart';


abstract class HomeScreenController extends GetxController{
  changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  
  int currentPage = 0;

  List<Widget> listPage = [
    HomePage(),
    Profil(),
    Messages(),
    Notifications(),
  ];

 

  @override
  changePage(int i) {
    currentPage = i ;
    update();
    
  }
  
}