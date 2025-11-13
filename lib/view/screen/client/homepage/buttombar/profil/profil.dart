import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/profilcontroller.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';
import 'package:karhabti_pfe/view/widget/home/nomet%20prenomcontainer.dart';
import 'package:karhabti_pfe/view/widget/home/profilcontainer.dart';

class Profil extends StatelessWidget {
  Profil({Key? key}) : super(key: key);
  ProfilControllerImp controller = Get.put(ProfilControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Le SafeArea évite que la liste touche la zone de statut
        child: ListView(
          // ListView est déjà scrollable => plus d'overflow
          children: [
            // Au lieu d'une Column, on place directement les widgets
            NomEtPrenomContainer(),
            SizedBox(height: 30), // réduit un peu pour éviter trop d'espace
            ProfilContainer(
              icon: Icons.face,
              Titre: "Informations Personnelles",
              text: "Modifier vos informations personnelles .",
              onTap: () {
                Get.toNamed(AppRoute.edit);
              },
            ),
            ProfilContainer(
              icon: Icons.calendar_month,
              Titre: "Mes rendez-vous",
              text: "Consultez vos rendez-vous prévus.",
              onTap: () {
                controller.goToRendezVous();
              },
            ),
            ProfilContainer(
              icon: Icons.campaign,
              Titre: "Mes annonces",
              text: "Gérer, modifier et booster vos annonces.",
              onTap: () {
                controller.goToAnnonces();
              },
            ),
          ],
        ),
      ),
    );
  }
}
