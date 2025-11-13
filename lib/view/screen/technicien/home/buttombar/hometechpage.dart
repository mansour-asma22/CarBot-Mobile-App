// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/technicien/homepagetechcontroller.dart';
import '../../../../../controller/client/homepagecontroller.dart';
import '../../../../widget/home/nomet prenomcontainer.dart';
import '../../../../widget/home/verticalcontainer.dart';

class HomeTechPage extends StatelessWidget {
   HomeTechPage({Key? key}) : super(key: key);
  HomePageTechControllerImp controller = Get.put(HomePageTechControllerImp());
  HomePageControllerImp controller2 = Get.put(HomePageControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NomEtPrenomContainer(),
            SizedBox(height: 40,),
            InkWell(
              child: VerticalContainer(image: "assets/images/rendez-vous.png", text: "Consulter Vos rendez-vous"),
                onTap: (){
                  controller.gotorendezvous();
                },
            ),
            InkWell(child: VerticalContainer(image: "assets/images/venach.png", text: "Cherchez-vous des pièces de rechange ? \n Avez-vous des pièces de rechange à vendre?"),onTap: (){controller2.goToVenteAchat();}),
          ],
        ),
      ),
    );
  }
}