import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/Repository/authentication_repository.dart';
import 'package:e_commerce_app/data/Model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Function to save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  // Function to fetch user details based on User ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw '';
    }
  }

  // Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } catch (e) {
      throw 'Somethings went wrong.Please try again.';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } catch (e) {
      throw 'Somethings went wrong.Please try again.';
    }
  }

  // Function to remove user data from Firestore
  Future<void> removeUserRecord(String uid) async {
    try {
      await _db.collection("Users").doc(uid).delete();
    } catch (e) {
      throw 'Somethings went wrong.Please try again.';
    }
  }

  // upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Somethings went wrong.Please try again.';
    }
  }
}
