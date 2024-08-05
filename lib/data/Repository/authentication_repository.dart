import 'package:e_commerce_app/Screen/Boarding%20Screen/onBoardingPage.dart';
import 'package:e_commerce_app/Screen/Login%20Screen/loginpage.dart';
import 'package:e_commerce_app/Screen/NavigatonBar/navigatonspage.dart';
import 'package:e_commerce_app/data/Repository/user_repository.dart';
import 'package:e_commerce_app/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    // Spash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      await SLocalStorage.init(user.uid);
      Get.offAll(() => NavigationMenu());
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(OnBoardingScreen());
    }
  }

  /* -------------------- Email & Password Sign in-------------------------*/
  // Email Authentication -signIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something sent wrong .Please try again';
    }
  }

  // Email Authentication -Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Goggle Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } catch (e) {
      if (kDebugMode) print('Somethings wnt wrong: $e');
      return null;
    }
  }

  // RE Authenticate User
  Future<void> reAuthenticationwithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

//  Resolve user Auth and Firestore Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
