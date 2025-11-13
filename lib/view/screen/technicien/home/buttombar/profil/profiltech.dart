import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/technicien/profiltechcontroller.dart';
import 'package:karhabti_pfe/view/widget/home/nomet%20prenomcontainer.dart';
import 'package:karhabti_pfe/view/widget/home/profilcontainer.dart';

// ignore: must_be_immutable
class ProfilTech extends StatelessWidget {
   ProfilTech({Key? key}) : super(key: key);
    ProfilTechControllerImp controller = Get.put(ProfilTechControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              NomEtPrenomContainer(),
              SizedBox(height: 50,),
              ProfilContainer(
                icon: Icons.face, 
                Titre: "  Information Personnelle", 
                text: "Modifier vos informations personnelles et verfifer votre compte.",
                onTap: (){
                  controller.gotoEditTechProfil();
                },
                ),
                 ProfilContainer(
                icon: Icons.garage, 
                Titre: "  Mon adresee", 
                text: "Ajouter ou Modifier votre adresse",
                onTap: (){
                  controller.goToAddress();
                },
                ),
                ProfilContainer(
                icon: Icons.campaign, 
                Titre: "  Mes annonces", 
                text: "Gérer, modifier et booster vos annonce.",
                onTap: (){
                  controller.goToAnnonces();
                },
                ),
                Container(
                  margin: EdgeInsets.only(left: 250),
                  child: Row(children: [
                    Text("Déconnexion") , 
                    IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined)),
                  ],),
                ),
            ],
          ),
        ],
      ),
    
    );
  }
}