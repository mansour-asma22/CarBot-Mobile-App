import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/widget/onboarding/technicien/skipbuton2.dart';
import '../../../controller/technicien/onboarding2_controller.dart';
import '../../widget/onboarding/technicien/customslider2.dart';
import '../../widget/onboarding/technicien/cutombuton2.dart';
import '../../widget/onboarding/technicien/dotcontroller2.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoarding2ControllerImp());
    return Scaffold(
      body: 
        Container(
          padding: EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/background.jpeg"),
      fit: BoxFit.fitHeight,
    ),
  ),
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  flex: 4,
                  child: CustomSlider2OnBoarding()
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                     SkipButton2(),
                     
                    CustomDot2Controller(),
                    
                    CustomButton2OnBoarding(),
               ] 
               ))
              ],
            ),
          ),
        )
    );
  }
}