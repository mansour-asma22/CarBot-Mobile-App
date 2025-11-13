import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constant/color.dart';
import '../../../../../widget/boutton.dart';
import 'package:karhabti_pfe/controller/client/user_profile_controller.dart';

class UserProfilePage extends StatelessWidget {
  // Pas besoin de TextEditingController ici pour la vue principale,
  // on en utilisera juste dans le dialog
  final userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          'Informations Personnelles',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(0),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/profil.png', height: 100, width: 100),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildEditableField(
                    'Nom d\'utilisateur',
                    userProfileController.username,
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  _buildEditableField(
                    'Adresse e-mail',
                    userProfileController.email,
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  _buildEditableField(
                    'Mot de passe',
                    userProfileController.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  _buildEditableField(
                    'Numéro de téléphone',
                    userProfileController.phone,
                    obscureText: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Boutton(
                color: ColorApp.primaryColor,
                text: "Sauvegarder",
                onPressed: () async {
                  // Quand on clique sur "Sauvegarder", on enregistre dans le JSON
                  await userProfileController.saveProfile();
                  Get.snackbar("Succès", "Profil sauvegardé localement");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Ce widget affiche la valeur + un bouton edit pour modifier
  Widget _buildEditableField(
      String label,
      RxString obsValue, {
        bool obscureText = false,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: "Comfortaa",
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            // Afficher la valeur de façon réactive
            Expanded(
              child: Obx(() {
                final text = obsValue.value;
                return Text(
                  obscureText ? '•' * text.length : text,
                  style: TextStyle(fontSize: 16),
                );
              }),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Ouvrir un dialog pour modifier la valeur
                TextEditingController dialogController =
                TextEditingController(text: obsValue.value);

                Get.defaultDialog(
                  title: 'Modifier $label',
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: dialogController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText: 'Nouveau $label',
                      ),
                    ),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () {
                      // Mettre à jour la valeur
                      obsValue.value = dialogController.text;
                      // Fermer le dialog
                      Get.back();
                    },
                    child: Text("Sauvegarder"),
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Annuler"),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
