import 'package:e_commerce_app/Get%20folder/onboardingGet.dart';
import 'package:e_commerce_app/Screen/Boarding%20Screen/onBoardingPage.dart';
import 'package:e_commerce_app/Screen/SlpashScrren.dart';
import 'package:e_commerce_app/bindings/general_binding.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/Repository/authentication_repository.dart';

void main() async {
 
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //  GetX Local Storage
  await GetStorage.init();
  // Await Splash until other item Load
  // FlutterNativeSplash.preserve(widgetBinding:widgetBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialBinding: GeneralBinding(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF7BA697)),
            useMaterial3: true,
          ),
          home: Scaffold(backgroundColor: Colors.green,body: Center(child: CircularProgressIndicator(color: Colors.white),),),
        );
      },
    );
  }
}
