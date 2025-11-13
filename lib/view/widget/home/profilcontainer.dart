import 'package:flutter/material.dart';

class ProfilContainer extends StatelessWidget {
  final IconData icon;
  final String Titre;
  final String text;
  final void Function()? onTap;
  const ProfilContainer({Key? key,
   required this.icon, 
   required this.Titre, 
   required this.text, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 120,
                            width: 350,
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
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 17 , vertical: 15),
                              child: Column(children: [
                                Row(children: [
                                  Icon(icon),
                                  Text(Titre , style: TextStyle(fontSize: 18 , fontFamily: "Comfortaa" , fontWeight: FontWeight.w700)),
                                  Spacer(),
                                  InkWell(child: Icon(Icons.arrow_forward_ios) , onTap: onTap,)
                                ],),
                                SizedBox(height: 30),
                                Text(text, style: TextStyle(fontSize: 14 , fontFamily: "Comfortaa" , fontWeight: FontWeight.w600))
                              ]),
                            ),
                          );
  }
}