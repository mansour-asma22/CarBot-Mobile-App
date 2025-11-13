import 'dart:convert';
import 'dart:io';

class LocalAdsStorage {
  // Définir le nom du fichier dans lequel on stockera les annonces
  final String fileName = "ads_data.json";

  // Cette méthode retourne le fichier où stocker les données.
  Future<File> get _localFile async {
    // Pour Android, sans path_provider, on peut utiliser un chemin absolu.
    // ATTENTION : Ce chemin fonctionne sur Android ; pour iOS, il faudra ajuster.
    // Ici, on tente d'écrire dans le répertoire des fichiers internes de l'app.
    final directory = Directory("/data/user/0/com.example.karhabti_pfe/files");
    // Créer le dossier si nécessaire :
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    return File('${directory.path}/$fileName');
  }

  // Sauvegarder la liste des annonces dans le fichier
  Future<File> saveAds(List<Map<String, dynamic>> adsList) async {
    final file = await _localFile;
    final jsonString = jsonEncode(adsList);
    print("DEBUG: Saving to file: ${file.path}");
    print("DEBUG: JSON data: $jsonString");
    return file.writeAsString(jsonString);
  }

  // Charger les annonces depuis le fichier
  Future<List<Map<String, dynamic>>> loadAds() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        return [];
      }
      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);
      print("DEBUG: Loaded JSON data: $jsonData");

      return jsonData.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      print("Erreur de lecture du fichier: $e");
      return [];
    }
  }
}
