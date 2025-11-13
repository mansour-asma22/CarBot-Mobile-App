import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/auth/signupcontroller.dart';
import 'package:karhabti_pfe/core/function/alertexitapp.dart';
import 'package:karhabti_pfe/view/widget/auth/socialmedia.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
// ignore: must_be_immutable
class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
 SignUpControllerImp controller = Get.put(SignUpControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                 body: WillPopScope(child: Container(
                        width: 500,
        padding: EdgeInsets.symmetric( horizontal: 25 , vertical: 10),
          decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/back2.jpeg" ),
      fit: BoxFit.fitHeight,
    ),
  ),

                  child: Form(
                  key: controller.formstate,
                    child: ListView(
                      children: [
                        Image.asset("assets/images/signup.png" , height: 170, width: 50, alignment: Alignment.topLeft,),
          CustomTextTiltleFormAuth(text :"20".tr),
         const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "21".tr),
        SizedBox(height: 15,),
          CustomTextFormAuth(
             //valid:(val){
             //   return ValidInput(val!, 8,30, "username");
           // },
          mycontroller: controller.username,
          hinttext: "22".tr,
          iconData: Icons.person_outline,
         ),
          CustomTextFormAuth(
           //  valid:(val){
            //  return ValidInput(val!, 8,30, "email");
           // },
          mycontroller: controller.email,
          hinttext: "16".tr,
          iconData: Icons.email_outlined,
         ),
          CustomTextFormAuth(
            // valid:(val){
               //return ValidInput(val!, 8,30, "phone");
            //},
          mycontroller: controller.phone,
          hinttext: "23".tr,
          iconData: Icons.phone_outlined,
         ),
          GetBuilder<SignUpControllerImp>
                           (builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon:(){
                              controller.showPassword();
                            } ,
                              //valid:(val){
                               //return ValidInput(val!, 8,30, "password");
                            // },
                           mycontroller: controller.password,
                           hinttext: "17".tr,
                           iconData: Icons.lock_outlined ,
                          ),),
         GetBuilder<SignUpControllerImp>
                           (builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon:(){
                              controller.showPassword();
                            } ,
                             // valid:(val){
                              // return ValidInput(val!, 8,30, "password");
                           //  },
                           mycontroller: controller.password2,
                           hinttext: "17".tr,
                           iconData: Icons.lock_outlined ,
                          ),),
         const SizedBox(height: 10,),
                       CustomButtomAuth(text: "14".tr, onPressed :() {
                controller.SignUp();
                controller.gotosuccesssignup();
                 controller.isBlur.value = true;
              }),
              SizedBox(height: 10),
              SocialMedia(),

                      ],
                    ),
                  ),
                 ),

                 onWillPop: alertExitApp)
                );
  }
}