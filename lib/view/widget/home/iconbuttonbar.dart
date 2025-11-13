import 'package:flutter/material.dart';

class IconButtonBar extends StatelessWidget {
  final IconData icon ;
  final void Function()? onPressed;
  
  const IconButtonBar({Key? key, required this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed ,child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon ) , 
              ],
            ),);
  }
}