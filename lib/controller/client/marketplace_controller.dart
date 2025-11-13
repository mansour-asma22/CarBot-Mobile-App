import 'dart:io';
import 'package:get/get.dart';
import '../../core/services/local_ads_storage.dart';

class MarketplaceController extends GetxController {
  // Liste des annonces locale (observable)
  var adsList = <Map<String, dynamic>>[].obs;

  // Instance de LocalAdsStorage pour lire/écrire le fichier JSON
  final LocalAdsStorage localStorage = LocalAdsStorage();

  @override
  void onInit() {
    super.onInit();
    loadAdsFromFile();
  }

  // Charger les annonces depuis le fichier et mettre à jour adsList
  Future<void> loadAdsFromFile() async {
    print("DEBUG: Loading ads from file...");
    List<Map<String, dynamic>> loadedAds = await localStorage.loadAds();
    print("DEBUG: Loaded ads: $loadedAds");
    adsList.value = loadedAds;
  }

  // Ajouter une annonce dans la liste et sauvegarder
  Future<void> addAd({
    required String titre,
    required String description,
    required String prix,
    File? imageFile, // Optionnel : pour ce prototype, on peut ignorer l'image ou la convertir en base64
  }) async {
    // Chemin de l'image
    String? imagePath;

    if (imageFile != null) {
      // Option 1 : On garde juste imageFile.path
      // imagePath = imageFile.path;

      // Option 2 (mieux) : On copie l'image dans /data/user/0/com.example.karhabti_pfe/files/images
      final directory = Directory("/data/user/0/com.example.karhabti_pfe/files/images");
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      final newPath = "${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";
      final newImageFile = await File(imageFile.path).copy(newPath);
      imagePath = newImageFile.path;
    }
    // Créer une nouvelle annonce (si image, tu peux ajouter une clé "imagePath" ou convertir l'image)
    Map<String, dynamic> newAd = {
      "titre": titre,
      "description": description,
      "prix": prix,
      // Par exemple, si tu souhaites sauvegarder le chemin de l'image (ou convertir en base64)
      "imagePath": imageFile?.path,
    };

    // Ajouter à la liste observable
    adsList.add(newAd);
    // Sauvegarder la liste dans le fichier JSON
    await localStorage.saveAds(adsList);
  }

  // Recherche locale : filtre la liste en fonction d'une requête
  List<Map<String, dynamic>> searchAds(String query) {
    if (query.isEmpty) return adsList;
    return adsList.where((ad) {
      String t = ad["titre"]?.toLowerCase() ?? "";
      String d = ad["description"]?.toLowerCase() ?? "";
      return t.contains(query.toLowerCase()) || d.contains(query.toLowerCase());
    }).toList();
  }
}
