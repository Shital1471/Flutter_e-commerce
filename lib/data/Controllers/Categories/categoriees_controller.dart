import 'dart:developer';

import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Model/categories_model.dart';
import 'package:e_commerce_app/data/Repository/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override

void onInit() {
  fetchCategories();
  super.onInit();
}

Future<void> fetchCategories() async {
  try {
    isLoading.value = true;
    final categories = await _categoryRepository.getAllCategories();
    log('Categories: $categories');
    allCategories.assignAll(categories);
    featuredCategories.assignAll(allCategories
    .where((category) => category.isFeatured && category.parentId == 'specific_parent_id')
    .take(8)
    .toList());
    log('Featured Categories: $featuredCategories');
    
    if (featuredCategories.isEmpty) {
      log('No featured categories found');
    } else {
      log('First Featured Category Name: ${featuredCategories.first.name}');
    }
  } catch (e) {
    log('$e');
    FullScreenLoader.errorSnackbar(title: 'Oh Snap!', message: e.toString());
  } finally {
    isLoading.value = false;
  }
}

}
