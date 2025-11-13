import 'package:flutter/material.dart';

class CustomTextfieldAuth extends StatelessWidget {
  final String hinttext;
  final bool? obscureText ;
  final double height;
  final TextEditingController? mycontroller;
  final void Function()? onTapIcon;
  final String labelText ;
  const CustomTextfieldAuth(
      {Key? key,
      this.onTapIcon,
      required this.hinttext,
       this.obscureText, 
       required this.height, required this.labelText,
       required this.mycontroller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin:const  EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: mycontroller,
          obscureText: obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber),
  ),
            labelText: labelText,
            labelStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 127, 127) ,fontFamily: "Comfortaa",fontWeight: FontWeight.w800) ,
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 131, 127, 127) ,fontFamily: "Comfortaa",fontWeight: FontWeight.w800) ,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
               EdgeInsets.symmetric(vertical:height, horizontal: 20),
                            border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14) ) ,),
          
        ),
      
    );
  }
}