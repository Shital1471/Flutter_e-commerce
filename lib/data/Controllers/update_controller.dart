import 'package:e_commerce_app/Profile%20Screen/profilescreen.dart';
import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Controllers/user_controller.dart';
import 'package:e_commerce_app/data/Repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog('Loading you in....');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoader.stopLoading();
      FullScreenLoader.sucessSnackBar(
          title: 'Congratulations', message: 'Your Name has been update');

      Get.off(() => ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.errorSnackbar(title: "Oh Snap!", message: e.toString());
    }
  }
}
