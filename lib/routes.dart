import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:karhabti_pfe/core/constant/routes.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/forgetpasswordtech.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/resetpasswordtech.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/successresetpasswordtech.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/verifycodetech.dart';
import 'package:karhabti_pfe/view/screen/auth/login.dart';
import 'package:karhabti_pfe/view/screen/auth/logintech.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:karhabti_pfe/view/screen/auth/signup.dart';
import 'package:karhabti_pfe/view/screen/annonces.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/successResetPassword.dart';
import 'package:karhabti_pfe/view/screen/auth/successSignUp.dart';
import 'package:karhabti_pfe/view/screen/auth/successsignuptech.dart';
import 'package:karhabti_pfe/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/profil/editprofil.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/profil/rendez-vous.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/buttombar/homepage.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/frais.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/homescreen.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/panne/localisation.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/panne/messagepanne.dart';
import 'package:karhabti_pfe/view/screen/client/onboarding.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/panne/panne.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/buttombar/profil/adresse.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/buttombar/profil/edittechprofil.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/buttombar/profil/maptech.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/hometechscreen.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/rendezvoustech.dart';
import 'package:karhabti_pfe/view/screen/technicien/onboarding2.dart';
import 'package:karhabti_pfe/view/screen/technicien/signuporlogin2.dart';
import 'package:karhabti_pfe/view/screen/venach/venteachat.dart';
import 'view/screen/auth/signuptech.dart';
import 'view/screen/client/homepage/panne/map.dart';
import 'view/screen/venach/postulation.dart';
import 'view/screen/technicien/home/buttombar/hometechpage.dart';
import 'view/screen/client/signuporligin.dart';
import 'package:karhabti_pfe/view/screen/client/homepage/panne/servicesmap.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.login, page: ()=>Login()),
  GetPage(name: AppRoute.logintech, page: ()=>LoginTech()),
  GetPage(name: AppRoute.signup, page: ()=>SignUp()),
  GetPage(name: AppRoute.signuptech, page: ()=>SignUpTech()),
  GetPage(name: AppRoute.signuporlogin, page: ()=>SignUpOrLogin()),
  GetPage(name: AppRoute.signuporlogin2, page: ()=>SignUpOrLogin2()),
  GetPage(name: AppRoute.home, page: ()=>HomePage()),
  GetPage(name: AppRoute.homescreen, page: ()=>HomeScreen()),
  GetPage(name: AppRoute.homescreentech, page: ()=>HomeTechScreen()),
  GetPage(name: AppRoute.hometech, page: ()=>HomeTechPage()),
  GetPage(name: AppRoute.onBoarding, page: ()=>OnBoarding()),
  GetPage(name: AppRoute.onBoarding2, page: ()=>OnBoarding2()),
  GetPage(name: AppRoute.panne, page: ()=>Panne()),
  GetPage(name: AppRoute.venteachat, page: ()=>VenteAchat()),
  GetPage(name: AppRoute.loc, page: ()=>Localisezvous()),
  GetPage(name: AppRoute.post, page: ()=>Postulation()),
  GetPage(name: AppRoute.edit, page: ()=>UserProfilePage()),
  GetPage(name: AppRoute.map, page: ()=>MapPage()),
  GetPage(name: AppRoute.maptech, page: ()=>MapTech()),
  GetPage(name: AppRoute.rendezvous, page: ()=>Calendrier()),
  GetPage(name: AppRoute.annonces, page: ()=>Annonces()),
  GetPage(name: AppRoute.edittechprofil, page: ()=>EditTechProfil()),
  GetPage(name: AppRoute.adresse, page: ()=>Adresse()),
  GetPage(name: AppRoute.rendezvoustech, page: ()=>RendezVousTech()),
  GetPage(name: AppRoute.frais, page: ()=>Frais()),
  GetPage(name: AppRoute.messagepanne, page: ()=>RobotScreen()),
  GetPage(name: AppRoute.forgetPassword, page: ()=>ForgetPassword()),
  GetPage(name: AppRoute.forgetPasswordtech, page: ()=>ForgetPasswordTech()),
  GetPage(name: AppRoute.resetPassword, page: ()=>ResetPassword()),
  GetPage(name: AppRoute.resetPasswordtech, page: ()=>ResetPasswordTech()),
  GetPage(name: AppRoute.verifycode, page: ()=>VerifyCode()),
  GetPage(name: AppRoute.verifycodetech, page: ()=>VerifyCodeTech()),
  GetPage(name: AppRoute.successSignUp, page: ()=>SuccessSignUp()),
  GetPage(name: AppRoute.successSignUptech, page: ()=>SuccessSignUpTech()),
  GetPage(name: AppRoute.successresetPassword, page: ()=>SuccessResetPassword()),
  GetPage(name: AppRoute.successresetPasswordTech, page: ()=>SuccessResetPasswordTech()),
  GetPage(
    name: "/servicesmap",
    page: () => ServicesMap(),
  ),];
