import 'dart:convert';

import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:e_commerce_app/data/Repository/product_repository.dart';
import 'package:e_commerce_app/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();
  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  Future<void> initFavorites() async {
    final json = SLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      // Custom toast
    } else {
      SLocalStorage.instance().removeData(productId);
      saveFavoritesToStorage();
      favorites.refresh();
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode('favorites');
    SLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
