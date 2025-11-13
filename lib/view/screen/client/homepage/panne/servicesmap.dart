import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../controller/client/locationcontroller.dart';
// On utilise le même contrôleur qu'avant

class ServicesMap extends StatelessWidget {
  ServicesMap({Key? key}) : super(key: key);

  // Récupération du contrôleur existant
  final Location_ControllerImp controller = Get.put(Location_ControllerImp());

  /// Ouvrir Google Maps avec [searchTerm] (ex: mécanicien, électricien, etc.)
  Future<void> openMapsSearch(double lat, double lon, String searchTerm) async {
    final zoomLevel = 14;
    // Construction de l'URL Google Maps
    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/search/$searchTerm/@$lat,$lon,${zoomLevel}z"
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      print("Impossible d'ouvrir Google Maps pour $searchTerm");
    }
  }

  /// Récupère la position, puis ouvre Google Maps avec la recherche
  Future<void> handleTap(String searchTerm) async {
    // 1) Récupérer la position
    await controller.getLocation();
    double lat = controller.latitude.value;
    double lon = controller.longitude.value;

    if (lat == 0.0 && lon == 0.0) {
      print("Position GPS non récupérée. Vérifiez le GPS ou les permissions.");
      return;
    }

    // 2) Ouvrir Google Maps avec le terme de recherche
    await openMapsSearch(lat, lon, searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services Nearby"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // On veut scroller horizontalement
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Container pour Mécanicien
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () => handleTap("mécanicien"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/mec.png", height: 60),
                    const SizedBox(height: 10),
                    const Text(
                      "Mécanicien\nà proximité",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Container pour Électricien
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () => handleTap("électricien"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/elect.png", height: 60),
                    const SizedBox(height: 10),
                    const Text(
                      "Électricien\nà proximité",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Container pour CarWash
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () => handleTap("car+wash"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/carwash.png", height: 60),
                    const SizedBox(height: 10),
                    const Text(
                      "Car Wash\nà proximité",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Container pour Climatisation
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () => handleTap("climatisation+auto"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ac.png", height: 60),
                    const SizedBox(height: 10),
                    const Text(
                      "Climatisation\nà proximité",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // ... Ajoute d’autres containers
          ],
        ),
      ),
    );
  }
}
