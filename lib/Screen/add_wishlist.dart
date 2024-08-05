import 'package:e_commerce_app/data/Controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddWishList extends StatelessWidget {
  final String productId;
  AddWishList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => IconButton(
        onPressed: () => controller.toggleFavoriteProduct(productId),
        icon: Icon(
            controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
            color:
                controller.isFavorite(productId) ? Colors.red : Colors.grey)));
  }
}
