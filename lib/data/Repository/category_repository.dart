

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/categories_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get All categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      
      final list =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      log('list: ${list}');
      return list;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
