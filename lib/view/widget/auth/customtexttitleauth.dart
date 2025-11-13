import 'package:flutter/material.dart';
import 'package:karhabti_pfe/core/constant/theme.dart';


class CustomTextTiltleFormAuth extends StatelessWidget {
  final String text;
  const CustomTextTiltleFormAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
            text,
            textAlign: TextAlign.center,
            style: ThemeStyle.headline1,
          );
  }
}