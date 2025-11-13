import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(
                      onPressed: (){
                        controller.next();
                      },
                      child:  Text("9".tr, style: TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w600),),
                      ),
                  );
  }
}