import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';

import '../../../../../controller/client/listcontroller.dart';
  
class Liste extends GetView<ListController> {

  const Liste({Key? key}) : super(key: key);
   static const TextStyle text  = TextStyle(
                          fontSize: 18 , 
                          wordSpacing: 3 , letterSpacing: 1,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,

                           );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(itemBuilder: (context , i)=>InkWell(
        onTap: (){
          Get.toNamed(AppRoute.profillisttech);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 90 , horizontal: 10),
          child: Column(
           children: [
            Text("Consulter la liste des techniciens et choisir le plus proche de votre position" ,  style: TextStyle(fontSize: 19 , fontFamily: "comfortaa" , fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), 
                                      ),
                                 ],
                                ),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Image.asset("assets/images/profil.png" , height: 80 , width: 80,),
                                      SizedBox(width: 20,),
                                      Text("FoulenFoulen ",style: text,),
                                    ]),
                                    SizedBox(height: 10,),
                                    Text("Mécanicien" , style: text,),
                                    Text("N°= 123456789",style: text,),
                                    Text("Distance = 50Km",style: text,),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border)
                                    ],)
        
                                  ],
                                ),
                                
            )
           ],
          ),
        ),
      ), )
    );
  }
}