import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/marketplace_controller.dart';
import 'package:karhabti_pfe/core/constant/color.dart';
import 'dart:io';

class Annonces extends StatelessWidget {
  const Annonces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupère l'instance du MarketplaceController
    final MarketplaceController marketplaceC = Get.find<MarketplaceController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () { Get.back(); },
        ),
        centerTitle: true,
        title: Text(
          'Consulter vos annonces',
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: marketplaceC.localStorage.loadAds(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final ads = snapshot.data!;
          if (ads.isEmpty) {
            return Center(child: Text("Aucune annonce publiée"));
          }
          return ListView.builder(
            itemCount: ads.length,
            itemBuilder: (context, index) {
              final ad = ads[index];
              final titre = ad["titre"] ?? "";
              final desc = ad["description"] ?? "";
              final prix = ad["prix"] ?? "";
              final imagePath = ad["imagePath"];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: (imagePath != null)
                      ? Image.file(
                    File(imagePath),
                    width: 50,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.image, size: 70), // Afficher un placeholder pour l'image
                  title: Text(titre),
                  subtitle: Text("$desc\nPrix : $prix"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
