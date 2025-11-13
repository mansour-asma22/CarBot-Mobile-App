import 'package:flutter/material.dart';
import 'package:karhabti_pfe/core/constant/theme.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text ;
  const CustomTextBodyAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
           child: Text(text,
           textAlign: TextAlign.center,
           style: ThemeStyle.headline2 , ) );
         
  }
}