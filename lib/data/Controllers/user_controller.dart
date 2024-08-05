import 'dart:developer';

import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/Screen/Login%20Screen/deleteAccount.dart';
import 'package:e_commerce_app/Screen/Login%20Screen/loginpage.dart';
import 'package:e_commerce_app/data/Repository/authentication_repository.dart';
import 'package:e_commerce_app/data/Model/user_model.dart';
import 'package:e_commerce_app/data/Repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final UserModel fetchedUser = await userRepository.fetchUserDetails();
      log('${fetchedUser.email}');
      user(fetchedUser);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isNotEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      FullScreenLoader.warningSnackbar(
        title: 'Data not saved',
        message:
            "Something went wrong while saving your information. You can re-save your data in your Profile.",
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(8.sp),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing');
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => DeleteAccount());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.warningSnackbar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDialog('Loading you in....');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticationwithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      FullScreenLoader.warningSnackbar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);
      if (image != null) {
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        FullScreenLoader.sucessSnackBar(
            title: 'Congratulation',
            message: 'Your Profile Image has been update!');
      }
    } catch (e) {
      FullScreenLoader.errorSnackbar(
          title: 'OhSnap', message: 'Something went wrong: $e');
    }
  }
}
