import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/marketplace_controller.dart';
import '../../../../controller/client/ventachcontroller.dart';
import '../../../core/constant/color.dart';


// ignore: must_be_immutable
class VenteAchat extends StatelessWidget {
   VenteAchat({Key? key}) : super(key: key);
    //VentAchCotrollerImp controller = Get.put(VentAchCotrollerImp());
   final VentAchCotrollerImp controller = Get.put(VentAchCotrollerImp());
   final MarketplaceController marketplaceC = Get.put(MarketplaceController()); // <-- Instanciation

   final TextEditingController searchController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back , color: Colors.black),
    onPressed: () {
      Get.back(); 
    },
  ),
  centerTitle: true,
  title: Text('Recherche de pièces ' , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.bold , fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.white.withAlpha(0),
),
      body: ListView(
        children: [
          Column(children: [
            AnimatedOpacity(
                opacity: 1.0, 
                duration: Duration(milliseconds: 500),
                child: Container(
                margin:EdgeInsets.symmetric(vertical: 10, horizontal: 20) ,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Rechercher",
                      hintStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 131, 127, 127) ,fontFamily: "Comfortaa",fontWeight: FontWeight.w800) ,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical:20, horizontal: 20),
                      suffixIcon: InkWell(
                        onTap: () {
                          marketplaceC.update();
                          // Ici, vous pouvez ajouter des actions lorsque l'utilisateur clique sur l'icône de recherche
                        },
                        child: Icon(Icons.search , color: Color.fromARGB(255, 131, 127, 127),),
                      ),
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(14) ) ,),
                  ),
                ),
              ),
            // Afficher la liste des annonces
            Obx(() {
              // Récupère la liste brute
              final allAds = marketplaceC.adsList;

              // Filtrer si tu veux
              final query = searchController.text;
              final filteredAds = marketplaceC.searchAds(query);

              if (filteredAds.isEmpty) {
                return const Text("Aucune annonce trouvée");
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredAds.length,
                itemBuilder: (context, index) {
                  final ad = filteredAds[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: ListTile(
                      leading: ad["imageFile"] != null
                          ? Image.file(ad["imageFile"], width: 80, fit: BoxFit.cover)
                          : const Icon(Icons.image),
                      title: Text(ad["titre"]),
                      subtitle: Text("${ad["description"]} - ${ad["prix"]}"),
                    ),
                  );
                },
              );
            }),
            // Bouton + pour ajouter une annonce
              Container(
                margin: EdgeInsets.only(left: 280 , top: 500),
                decoration: BoxDecoration(
                color:ColorApp.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(onPressed: (){
                  controller.goToPostulation();
                }, icon: Icon(Icons.add ))),

          ]),
        ],
      ),
    );
  }
}