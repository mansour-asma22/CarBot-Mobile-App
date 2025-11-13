import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class NomEtPrenomContainer extends StatelessWidget {
  const NomEtPrenomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.width /3, 
            decoration: BoxDecoration(
                           gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                ColorApp.primaryColor,
                                Color.fromARGB(255, 255, 255, 255),                           
                              ],
                            ),
                        ),
          ),
          Positioned(
            top: Get.width/10.5,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/profil.png") ,
              ),
            ),
            )
        ],
      ),
    );
            
  }
}