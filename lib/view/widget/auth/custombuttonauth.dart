import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 70),
      onPressed: onPressed,
      color: Colors.white,
      child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , fontFamily: "Comfortaa",)),
    );
  }
}
