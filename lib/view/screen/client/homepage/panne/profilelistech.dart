import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:karhabti_pfe/view/widget/boutton.dart';
import 'package:karhabti_pfe/view/widget/home/nomet%20prenomcontainer.dart';


class ProfilListTech extends StatelessWidget {
  const ProfilListTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical:10),
        child: Column(
          children: [
            NomEtPrenomContainer(),
                       Container(
              height: 400,
              width: 400,
              padding: EdgeInsets.symmetric(vertical: 30 , horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 50),
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
                   Text("Foulen Fooulen", style: TextStyle(
                      fontSize: 24 , 
                      wordSpacing: 3 ,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,

                       ),),
                       SizedBox(height: 30,),
                  Text("Specialité :  Mécanicien                    ", style: TextStyle(
                            fontSize: 18 , 
                            wordSpacing: 3 ,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
            
                             ),),
                             SizedBox(height: 20,),
                  Text("Adresse : xxxxxxxx                             ", style: TextStyle(
                            fontSize: 18 , 
                            wordSpacing: 3 ,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                             ),),
                             SizedBox(height: 20,),
                  Text("Numero de telephone : 123456789  ", style: TextStyle(
                            fontSize: 18 , 
                            wordSpacing: 3 ,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                             ),), 
                             SizedBox(height:70,),
                   Text("Donner votre Avis : " , style: TextStyle(
                            fontSize: 20 , 
                            wordSpacing: 3 ,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
            
                             ),)   ,
                             SizedBox(height: 20,),
                             RatingBar.builder(
                                initialRating: 0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 40,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )    ,
                ],
              ),
            ),
            SizedBox(height: 10,),
            Boutton(text: "Prendre un Rendez-Vous", color: Colors.amber)
          ],
        ),
      ),
    
    );
  }
}