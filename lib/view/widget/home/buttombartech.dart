import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/color.dart';
import '../../../controller/technicien/homepagetechcontroller.dart';

// ignore: must_be_immutable
class ButtomBarTech extends StatelessWidget {
 final Function()? onPressed;
 final IconData icon ; 
 final bool? active ;
 final String text ; 
    ButtomBarTech(
    {Key? key,
    required this.onPressed,
    required this.active, 
    required this.icon,
    required this.text })
     : super(key: key);
    HomePageTechControllerImp controller = Get.put(HomePageTechControllerImp());

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon( icon , 
          color:  active == true ? ColorApp.primaryColor:Colors.black,
          ),
          Text(text , style: TextStyle(fontSize: 11 , fontFamily: "Comfortaa", fontWeight: FontWeight.w700 , color: active == true ? Color.fromARGB(255, 255, 203, 30):Colors.black,),),
      ]),
      );
  }
}

