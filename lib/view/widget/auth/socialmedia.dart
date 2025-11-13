import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/controller/google_signin_controller.dart';
import 'package:karhabti_pfe/core/constant/color.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignInController googleController = Get.put(GoogleSignInController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      InkWell(
        onTap: () async {
          // Lancer la connexion Google
          await googleController.signInWithGoogle();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 70),

          decoration: BoxDecoration(
          boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), 
                                  ),],
          borderRadius: BorderRadius.circular(20),
        color: Colors.white),
        child: Row(
          children: [
            Text("Continuer avec Google" , style: TextStyle(fontFamily: "Comfortaa" , fontWeight: FontWeight.bold),),
            SizedBox(width: 5,),
            Image.asset("assets/images/google.png",height: 30 , width: 30,),
          ],
        ),
        ),
      ),
      ],
    );
  }
}