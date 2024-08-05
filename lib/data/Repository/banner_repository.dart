import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/Model/banner_model.dart';
import 'package:get/get.dart';

class BannerRepositroy extends GetxController {
  static BannerRepositroy get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Somethings went wrong while fetching Banners.';
    }
  }
}
