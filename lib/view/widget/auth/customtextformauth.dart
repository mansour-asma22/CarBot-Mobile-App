import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool? obscureText ;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {Key? key,
      this.onTapIcon,
      required this.hinttext,
      required this.iconData,
      required this.mycontroller,
       this.obscureText,})
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
    borderSide: BorderSide(color: Color.fromARGB(255, 33, 32, 30)),
  ),
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 14, color: ColorApp.hinttext ,fontFamily: "Comfortaa",fontWeight: FontWeight.w800) ,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
              const EdgeInsets.symmetric(vertical:20, horizontal: 20),
              
              suffixIcon:InkWell(child:  Icon(iconData , color: Color.fromARGB(255, 131, 127, 127),), onDoubleTap:onTapIcon ,),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14) ) ,),
        ),
      
    );
  }
}