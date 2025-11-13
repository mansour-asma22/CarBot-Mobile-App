import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/onboarding_controller.dart';
import 'package:karhabti_pfe/view/widget/onboarding/client/custombutton.dart';
import 'package:karhabti_pfe/view/widget/onboarding/client/customslider.dart';
import 'package:karhabti_pfe/view/widget/onboarding/client/dotcontroller.dart';
import '../../widget/onboarding/client/skipbutton.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
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
                  child: CustomSliderOnBoarding()
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                     SkipButton(),
                    CustomDotController(),
                    CustomButtonOnBoarding(),
               ] 
               ))
              ],
            ),
          ),
        )
    );
  }
}