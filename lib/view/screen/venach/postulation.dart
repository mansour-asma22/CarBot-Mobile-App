import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:karhabti_pfe/view/widget/boutton.dart';
import '../../../controller/postcontroller.dart';
import '../../../core/constant/color.dart';
import '../../widget/home/customtextfieldpost.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/client/marketplace_controller.dart'; // <-- Import


// ignore: must_be_immutable
class Postulation extends StatelessWidget {
  Postulation({Key? key}) : super(key: key);
  final PostController controller = Get.put(PostController());
  final MarketplaceController marketplaceC = Get.find<MarketplaceController>();
  // <-- On récupère l'instance existante


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
          'Ajouter une annonce',
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/post.png",
                    height: 190,
                  ),
                  SizedBox(height: 10),
                  CustomTextfieldAuth(
                    mycontroller: controller.titre,
                    height: 20,
                    hinttext: "Ex: Plaquettes de frein",
                    labelText: "Titre",
                  ),
                  CustomTextfieldAuth(
                    mycontroller: controller.description,
                    height: 70,
                    hinttext: "Ex: haute qualité qui offre une performance fiable",
                    labelText: "Description",
                  ),
                  CustomTextfieldAuth(
                     mycontroller: controller.prix,
                    height: 20,
                    hinttext: "Ex: 50 euro",
                    labelText: "Prix",
                  ),
                 GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choisir une source',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Comfortaa",
              fontWeight: FontWeight.w900,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        'Galerie',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Comfortaa",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.image, color: ColorApp.primaryColor),
                    ],
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    await controller.image.pickImage(ImageSource.gallery);
                    
                  },
                ),
                SizedBox(height: 10),
                Text("----------------------------------"),
                SizedBox(height: 10),
                GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        'Appareil photo',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Comfortaa",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.camera_alt, color: ColorApp.primaryColor),
                    ],
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    await controller.image.pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  },
  child: Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      border: Border.all(color: ColorApp.primaryColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: controller.image.pickedImage != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              controller.image.pickedImage!,
              fit: BoxFit.cover,
            ),
          )
        : Icon(
            Icons.add_a_photo,
            size: 40,
            color: Colors.grey,
          ),
  ),
),

                  SizedBox(height: 20),
                  Boutton(
                    text: "Postuler",
                    color: ColorApp.primaryColor,
                    onPressed: () async  {
                      // 1) Récupérer les valeurs
                      final titre = controller.titre.text;
                      final desc = controller.description.text;
                      final prix = controller.prix.text;
                      final imageFile  = controller.image.pickedImage;

                      // 2) Ajouter l'annonce dans MarketplaceController
                      await marketplaceC.addAd(
                        titre: titre,
                        description: desc,
                        prix: prix,
                        imageFile: imageFile,
                      );

                      // 3) Revenir à la page précédente
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



