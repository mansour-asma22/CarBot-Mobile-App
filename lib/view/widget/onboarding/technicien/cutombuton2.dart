import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/technicien/onboarding2_controller.dart';

class CustomButton2OnBoarding extends GetView<OnBoarding2ControllerImp> {
  const CustomButton2OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(                      
                      onPressed: (){
                        controller.nextt();
                      },
                      child:  Text("9".tr, style: TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w600),),
                      ),
                  );
  }
}