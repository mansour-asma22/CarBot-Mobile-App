import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/technicien/onboarding2_controller.dart';
import '../../../../data/datasource/static/static.dart';

class CustomSlider2OnBoarding extends GetView<OnBoarding2ControllerImp> {
  const CustomSlider2OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.page2Controller,
      onPageChanged: (val){
        controller.onPageChangedd(val);
      },
                  itemCount: onBoardingList1.length,
                  itemBuilder: (context ,i) => Column
                  (children: [
                     Container(
                       width: 330, 
                       height: 350, 
                       child: Image.asset(onBoardingList1[i].image! ,                        )
                     ),
                      const SizedBox(height: 15,),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text
                            (onBoardingList1[i].title!,
                             textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 23 , fontWeight: FontWeight.w600 ,fontFamily: "Comfortaa",),
                                 
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height:10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text
                        (onBoardingList1[i].body! , textAlign: TextAlign.center, 
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 , fontFamily: "Comfortaa",)
                         ),
                      )
                ])
                    ,);
  }
}