import 'package:flutter/material.dart';

class VerticalContainer extends StatelessWidget {
  const VerticalContainer({Key? key, required this.image, required this.text, }) : super(key: key);
  final String image;
  final String text ; 
  

  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 30 ),
                    width: 400,
                    height: 330,
                   decoration: BoxDecoration(
                        color: Colors.white,
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), 
                                  ),],
                                  borderRadius: BorderRadius.circular(20)
                      ),
                  child: Column(
                    children: [
                      Text(text , style: TextStyle(fontFamily: "Comfortaa" , fontSize: 15, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                      Image.asset(image ,fit: BoxFit.cover, height: 230,), 
                    ],
                  ),
                );
  }
}