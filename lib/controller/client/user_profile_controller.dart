import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  // Variables du profil
  var username = "Asma Mansour".obs;
  var email = "asmamansour@gmail.com".obs;
  var password = "••••••••".obs;
  var phone = "0613549726".obs;

  // Méthode pour sauvegarder le profil dans un fichier JSON
  Future<void> saveProfile() async {
    final profileData = {
      "username": username.value,
      "email": email.value,
      "password": password.value,
      "phone": phone.value,
    };
    final directory = Directory("/data/user/0/com.example.karhabti_pfe/files");
    if (!directory.existsSync()) directory.createSync(recursive: true);
    final file = File("${directory.path}/profile.json");
    final jsonString = jsonEncode(profileData);
    await file.writeAsString(jsonString);
    print("Profil sauvegardé : $jsonString");
  }

  // Méthode pour charger le profil depuis le fichier JSON
  Future<void> loadProfile() async {
    final directory = Directory("/data/user/0/com.example.karhabti_pfe/files");
    final file = File("${directory.path}/profile.json");
    if (!file.existsSync()) {
      print("Pas de fichier profile.json, on garde les valeurs par défaut");
      return;
    }
    final jsonString = await file.readAsString();
    final Map<String, dynamic> data = jsonDecode(jsonString);
    username.value = data["username"];
    email.value = data["email"];
    password.value = data["password"];
    phone.value = data["phone"];
    print("Profil chargé : $data");
  }

  @override
  void onInit() {
    super.onInit();
    loadProfile(); // Charger le profil au démarrage
  }
}
