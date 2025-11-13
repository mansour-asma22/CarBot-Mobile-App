import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/buttombar/notificationtech.dart';
import '../../view/screen/technicien/home/buttombar/hometechpage.dart';
import '../../view/screen/technicien/home/buttombar/messagetech.dart';
import '../../view/screen/technicien/home/buttombar/profil/profiltech.dart';


abstract class HomeScreenTechController extends GetxController{
  changePage(int currentPage);
}
class HomeScreenTechControllerImp extends HomeScreenTechController{
  
  int currentPage = 0;

  List<Widget> listPage = [
    HomeTechPage(),
    ProfilTech(),
    MessagesTech(),
    NotificationTech(),
  ];

 

  @override
  changePage(int i) {
    currentPage = i ;
    update();
    
  }
  
}