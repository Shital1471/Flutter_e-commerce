import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Repository/authentication_repository.dart';
import 'package:e_commerce_app/data/Controllers/user_controller.dart';
import 'package:e_commerce_app/data/network_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStroage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    final rememberMeEmail = localStroage.read('REMEMBER_ME_EMAIL');
    final rememberMePassword = localStroage.read('REMEMBER_ME_PASSWORD');
    if (rememberMeEmail != null) {
      email.text = rememberMeEmail;
    }
    if (rememberMePassword != null) {
      password.text = rememberMePassword;
    }
    super.onInit();
  }

  void emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog('Loading you in....');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!loginFromKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStroage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStroage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }
      final UserCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      FullScreenLoader.stopLoading();
      //
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    // final userController = UserController.instance;
    try {
      FullScreenLoader.openLoadingDialog('Loading you in....');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);
      FullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.errorSnackbar(title: "Oh Snap", message: e.toString());
    }
  }
}
