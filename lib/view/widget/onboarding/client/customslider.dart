import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/client/onboarding_controller.dart';
import '../../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
                  itemCount: onBoardingList.length,
                  itemBuilder: (context ,i) => Column
                  (children: [
                     Container(
                       width: 330, 
                       height: 350, 
                       child: Image.asset(onBoardingList[i].image! ,                        )
                     ),
                      const SizedBox(height: 40,),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text
                            (onBoardingList[i].title!,
                             textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 23 , fontWeight: FontWeight.w900 ,fontFamily: "Comfortaa",),
                                 
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height:20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text
                        (onBoardingList[i].body! , textAlign: TextAlign.center, 
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 , fontFamily: "Comfortaa",)
                         ),
                      )
                ])
                    ,);
  }
}