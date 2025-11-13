import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/routes.dart';
import 'package:karhabti_pfe/view/screen/areyou.dart';
import 'package:karhabti_pfe/view/screen/pageone.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import '../../../controller/client/marketplace_controller.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Get.put(MarketplaceController());
  await Firebase.initializeApp(); // Initialise Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations : MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      home:  PageOne(),
      getPages: routes
    ); 
  }
}

