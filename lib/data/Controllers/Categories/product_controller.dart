import 'dart:developer';

import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:e_commerce_app/data/Repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  @override
  void onInit() {
    fetchFeaturedProducts();
    log('hyyy');
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      log(' products: $products.length');
      featuredProducts.assignAll(products);
    } catch (e, stackTrace) {
         log('Error fetching products: $e\n$stackTrace');

      FullScreenLoader.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
