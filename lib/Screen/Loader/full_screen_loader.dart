import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
                child: Container(
              color: Colors.green,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
static warningSnackbar({required title,String message=''}){
  Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2,color: Colors.white,)
    );
}
  static errorSnackbar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2,color: Colors.white,)
    );
  }
  static sucessSnackBar({required title, message='',duration=3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check,color: Colors.white,)
    );
  }
}
