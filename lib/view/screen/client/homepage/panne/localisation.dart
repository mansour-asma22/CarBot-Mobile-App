import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../controller/client/locationcontroller.dart';

import '../../../../../core/constant/color.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';

class Localisezvous extends StatelessWidget {
  Localisezvous({Key? key}) : super(key: key);

  // On récupère l'instance de notre Location_ControllerImp
  final Location_ControllerImp controller = Get.put(Location_ControllerImp());

  /// Fonction pour ouvrir Google Maps autour de (lat, lon) en cherchant "mécanicien"
  Future<void> openMapsService(double lat, double lon, String serviceTerm) async {
    // Niveau de zoom (entre 0 et 21)
    final zoomLevel = 14;

    // Construire l'URL pour recherche "mécanicien" proche de la position
    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/search/$serviceTerm/@$lat,$lon,${zoomLevel}z"
    );

    // Vérifier si on peut ouvrir l'URL (Google Maps ou navigateur)
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      print("Impossible d'ouvrir Google Maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    // On récupère l'argument passé par goToLoc(serviceTerm)
    final String serviceTerm = Get.arguments ?? "mécanicien";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Localisation",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Image.asset("assets/images/loc.png", height: 300),
            const SizedBox(height: 50),
            // NE PAS mettre "const" ici car on utilise "$serviceTerm"
            Text(
              "Cliquez sur le bouton ci-dessous pour rechercher : $serviceTerm",
              style: const TextStyle(
                fontSize: 19,
                fontFamily: "Comfortaa",
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            Boutton(
              text: "Recherche $serviceTerm",
              color: ColorApp.primaryColor,
              onPressed: () async {
                // 1) Récupération de la position
                await controller.getLocation();
                double lat = controller.latitude.value;
                double lon = controller.longitude.value;

                if (lat == 0.0 && lon == 0.0) {
                  print("Position non récupérée ou GPS désactivé");
                  return;
                }
                // 2) Appel de la méthode qui ouvre Google Maps pour "serviceTerm"
                await openMapsService(lat, lon, serviceTerm);
              },
            ),
          ],
        ),
      ),
    );
  }
}
