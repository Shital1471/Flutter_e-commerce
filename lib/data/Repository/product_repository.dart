import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      print('Error fetching featured products: $e');
      throw 'Error fetching featured products: $e';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productItem) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productItem)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      print('Error fetching featured products: $e');
      throw 'Error fetching featured products: $e';
    }
  }
}
