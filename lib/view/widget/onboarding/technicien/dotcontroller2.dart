import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../controller/technicien/onboarding2_controller.dart';
import '../../../../data/datasource/static/static.dart';

class CustomDot2Controller extends StatelessWidget {
  const CustomDot2Controller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoarding2ControllerImp>(
      builder: ((controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                    onBoardingList1.length,
                     (index) => AnimatedContainer(
                      margin: const EdgeInsets.all(5),
                    duration: const Duration(microseconds:900 ),
                    width: controller.currenttPage == index ? 15 : 6,
                    height: 6,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    ))
                    ],
                  ))
      );
  }
}