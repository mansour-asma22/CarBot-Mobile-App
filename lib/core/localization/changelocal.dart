import 'dart:ui';

import 'package:get/get.dart';

import '../services/services.dart';

class LocaleController extends GetxController{

  Locale? language ;

  MyServices myServices = Get.find();

  changeLang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    
      language = Locale (Get.deviceLocale!.languageCode);
    
    super.onInit();
  }
}