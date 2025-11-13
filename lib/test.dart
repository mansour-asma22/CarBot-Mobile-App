import 'package:flutter/material.dart';

import 'core/constant/color.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height : 200 , 
      width: 200,
      color: Color.fromARGB(255, 248, 188, 7),
    );
  }
}