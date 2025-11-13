import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FraisController extends GetxController {
  void registerDates();
}

class FraisControllerImp extends FraisController {
  late TextEditingController assurance;
  late TextEditingController vignette;
  late TextEditingController visite;

  @override
  void onInit() {
    assurance = TextEditingController();
    vignette = TextEditingController();
    visite = TextEditingController();
    super.onInit();
    loadDatesFromPrefs(); // On essaye de charger les dates déjà enregistrées
  }

  @override
  void dispose() {
    assurance.dispose();
    vignette.dispose();
    visite.dispose();
    super.dispose();
  }

  @override
  void registerDates() async {
    final assurText = assurance.text.trim();
    final vignText = vignette.text.trim();
    final visiteText = visite.text.trim();

    if (assurText.isEmpty || vignText.isEmpty || visiteText.isEmpty) {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir toutes les dates.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Sauvegarder
    await saveDatesToPrefs(assurText, vignText, visiteText);

    // Feedback
    Get.snackbar(
      "Succès",
      "Enregistré !\nAssurance: $assurText\nVignette: $vignText\nVisite: $visiteText",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Option : vider les champs (ou pas)
    // assurance.clear();
    // vignette.clear();
    // visite.clear();

    // ICI : planifier des notifications
    // Ex: scheduleNotifications(assurText, vignText, visiteText);
  }

  /// Sauvegarde les dates dans SharedPreferences
  Future<void> saveDatesToPrefs(String assur, String vign, String visit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('assurance_date', assur);
    await prefs.setString('vignette_date', vign);
    await prefs.setString('visite_date', visit);
  }

  /// Charger les dates si elles existent
  Future<void> loadDatesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final assur = prefs.getString('assurance_date') ?? "";
    final vign = prefs.getString('vignette_date') ?? "";
    final visit = prefs.getString('visite_date') ?? "";

    // Mettre ces valeurs dans les TextEditingController
    assurance.text = assur;
    vignette.text = vign;
    visite.text = visit;
  }
}
