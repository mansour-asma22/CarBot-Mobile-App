import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/technicien/onboarding2_controller.dart';

class SkipButton2 extends GetView<OnBoarding2ControllerImp> {
  const SkipButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(
                       onPressed: (){
                        controller.skipp();
                      },
                      child:  Text("10".tr, style: TextStyle(fontFamily: "Comfortaa" , fontWeight: FontWeight.w600),),
                      ),
                  );
  }
}