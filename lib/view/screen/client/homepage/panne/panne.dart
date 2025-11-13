import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';
import '../../../../../controller/client/panneController.dart';
import '../../../../../core/constant/color.dart';

class Panne extends StatelessWidget {
  Panne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // On récupère notre contrôleur
    PanneControllerImp controller = Get.put(PanneControllerImp());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          '50'.tr, // <-- "50".tr : traduction, adapte si besoin
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(0),
      ),
      body: Column(
        children: [
          // Image illustrative
          Image.asset(
            "assets/images/pannepage.png",
            height: 100,
            width: 100,
          ),

          // Titre principal
          Text(
            "51".tr, // <-- "51".tr : traduction, adapte si besoin
            style: const TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          // --- Plusieurs boutons pour différents types de pannes ---

          // 1) Bouton Mécanicien
          Boutton(
            text: "Mécanicien à proximité", // ou "52".tr selon tes traductions
            onPressed: () {
              // Appelle goToLoc("mécanicien") pour localiser un mécanicien
              controller.goToLoc("mécanicien");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 2) Bouton Électricien
          Boutton(
            text: "Électricien à proximité", // ou "53".tr
            onPressed: () {
              controller.goToLoc("électricien");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 3) Bouton Tolier
          Boutton(
            text: "Tolier à proximité",
            onPressed: () {
              controller.goToLoc("tolier");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 4) Bouton Pneu
          Boutton(
            text: "Pneu à proximité",
            onPressed: () {
              controller.goToLoc("pneu");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 5) Bouton Vitrage
          Boutton(
            text: "Vitrage à proximité",
            onPressed: () {
              controller.goToLoc("vitrage");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 6) Bouton Climatisation
          Boutton(
            text: "Climatisation à proximité",
            onPressed: () {
              controller.goToLoc("climatisation");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 5),

          // 7) Bouton Lavage
          Boutton(
            text: "Lavage voiture à proximité",
            onPressed: () {
              controller.goToLoc("lavage");
            },
            color: ColorApp.primaryColor,
          ),

          const SizedBox(height: 25),

          // Lien pour un "assistant virtuel" ou autre
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.messagepanne);
            },
            child: Text(
              "54".tr, // <-- "54".tr : traduction
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: "Comfortaa",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
