import 'dart:ffi';

import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Model/banner_model.dart';
import 'package:e_commerce_app/data/Repository/banner_repository.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banner = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepositroy());
      final banners = await bannerRepo.fetchBanner();

      this.banner.assignAll(banners);
    } catch (e) {
      FullScreenLoader.errorSnackbar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
