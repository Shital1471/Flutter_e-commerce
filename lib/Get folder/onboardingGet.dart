import 'package:e_commerce_app/Screen/Login%20Screen/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();
  RxInt _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  void updatePageIndicator(int index) {
    _currentPage.value = index;
  }

  void dotNavigationClick(int index) {
    _currentPage.value = index;
    pageController.jumpTo(index as double);
  }

  void nextPage(BuildContext context) {
    if (currentPage == 2) {
      // navigate to login page;
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(LoginScreen());
    } else {
      int page = currentPage + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    _currentPage.value = 2;
    pageController.jumpToPage(2);
  }
}
