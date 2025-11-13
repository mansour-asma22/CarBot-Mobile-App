import 'package:flutter/material.dart';

class HorizontalContainer extends StatelessWidget {
  final String image ;
  final String text;
  const HorizontalContainer({Key? key, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.all(20),
                    height: 200,
                    width:340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), 
                                  ),]
                    ),
                    child: Row(
                      children: [
                        Text(text ,style: TextStyle(fontFamily: "Comfortaa" , fontSize:18, fontWeight: FontWeight.w700),),
                        Image.asset(image , height: 140,width: 140,)
                      ],
                    ),
                 
      
    );
  }
}