import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/auth/logincontroller.dart';
import 'package:karhabti_pfe/core/function/alertexitapp.dart';
import 'package:karhabti_pfe/view/widget/auth/customtextbodyauth.dart';
import 'package:karhabti_pfe/view/widget/auth/socialmedia.dart';
import 'package:karhabti_pfe/view/widget/auth/textsignuporsignin.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller =Get.put(LoginControllerImp());
    return Scaffold(
                 body:WillPopScope(
                  onWillPop: alertExitApp,
                  child:  Container(
                  width: 500,
        padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/background.jpeg" ),
      fit: BoxFit.fitHeight,
    ),
  ),
                   child: Container(
                    padding: const EdgeInsets.symmetric( horizontal: 25 ),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          SizedBox(height: 20,),
                          Image.asset("assets/images/signup2.png" , height: 150, width: 160,),
                          SizedBox(height: 10,),
                           CustomTextTiltleFormAuth(text :"Sign In"),
                          const SizedBox(height: 10,),
                           CustomTextBodyAuth(text: "15".tr),
                          const SizedBox(height: 100,),
                           CustomTextFormAuth(
                           //  valid:(val){
                            //   return ValidInput(val!, 8,30, "email");
                            // },
                           mycontroller: controller.email,
                           hinttext: "16".tr,
                           iconData: Icons.email_outlined,
                          ),
                           GetBuilder<LoginControllerImp>
                           (builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon:(){
                              controller.showPassword();
                            } ,
                             // valid:(val){
                              // return ValidInput(val!, 8,30, "password");
                            // },
                           mycontroller: controller.password,
                           hinttext: "17".tr,
                           iconData: Icons.lock_outlined ,
                          ),),
                           InkWell(child: Text("18".tr , textAlign: TextAlign.end, style: TextStyle(fontSize: 12 ,  decoration: TextDecoration.underline),) , onTap: (){controller.goToForgetPassword();},),
                      const SizedBox(height: 50,),
                      CustomTextSignUpOrSignIn(
                      texttwo: "14".tr,textone: "19".tr, 
                      onTap: (){
                        controller.goToSignUp();
                      },),
                       CustomButtomAuth(text: "13".tr, onPressed :() {
                        controller.login();
                       }),
                       SizedBox(height: 10),
                       SocialMedia()
                        ],
                      ),
                    ),
                   ),
                 ),
                  )
                );
  }
} 