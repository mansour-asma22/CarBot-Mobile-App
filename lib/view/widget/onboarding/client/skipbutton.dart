import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/onboarding_controller.dart';

class SkipButton extends GetView<OnBoardingControllerImp> {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(
                       onPressed: (){
                        controller.skip();
                      },
                      child:  Text("10".tr, style: TextStyle(fontFamily: "Comfortaa" , fontWeight: FontWeight.w600),),
                      ),
                  );
  }
}