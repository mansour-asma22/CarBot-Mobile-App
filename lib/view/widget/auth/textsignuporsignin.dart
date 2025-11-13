import 'package:flutter/material.dart';


class CustomTextSignUpOrSignIn extends StatelessWidget {
 final String textone;
 final String texttwo;
 final void Function()? onTap;
  const CustomTextSignUpOrSignIn ({Key? key, required this.textone, required this.texttwo, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(textone ,textAlign:TextAlign.end) ,
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: onTap,
                        child: Text(texttwo , style: const TextStyle(fontWeight: FontWeight.bold,  decoration: TextDecoration.underline  , fontFamily: "Comfortaa",),) , ),
                    ],
                  );
  }
}