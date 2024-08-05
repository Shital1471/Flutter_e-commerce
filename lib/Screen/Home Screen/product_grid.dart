import 'package:e_commerce_app/Screen/Home%20Screen/gridview_builder.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../data/Controllers/Categories/product_controller.dart';
import '../../shimmer_effect.dart';

class ProductGrid extends StatelessWidget {
 const ProductGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(), // Initialize ProductController here
      builder: (productController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (productController.isLoading.value)
              return ShimmerEffect(height: 15, width: 110);
            if (productController.featuredProducts.isEmpty)
              return Center(
                child: Text(
                  'No Data Found',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            return GridLayout(
              itemCount: productController.featuredProducts.length,
              itemBuilder: (_, index) =>
                  ProductCardVertical(productModel: productController.featuredProducts[index],),
            );
          }),
        );
      },
    );
  }
}