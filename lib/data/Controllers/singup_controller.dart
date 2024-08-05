import 'package:e_commerce_app/Screen/Boarding%20Screen/onBoardingPage.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/homepage.dart';
import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/Screen/Login%20Screen/loginpage.dart';
import 'package:e_commerce_app/Screen/NavigatonBar/navigatonspage.dart';
import 'package:e_commerce_app/data/Repository/authentication_repository.dart';
import 'package:e_commerce_app/data/Repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/user_model.dart';
import '../network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final hidePassword = true.obs;
  final deviceStorage = GetStorage();
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  void signup() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'We are Processing your information.....');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy Check

      // Register user in the Firebase Authentication and save user data in the firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save Authentication user data in the firebase firestor
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      FullScreenLoader.stopLoading();

      //  Show Success Message
      FullScreenLoader.sucessSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      // Move to verify Email Screen
      Get.to(() => NavigationMenu());
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
