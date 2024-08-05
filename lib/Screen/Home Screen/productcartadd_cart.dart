import 'package:e_commerce_app/data/Controllers/cart_controller.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCrtButton extends StatelessWidget {
  final ProductModel product;
  ProductCartAddToCrtButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(onTap: () {
      final cartItem = cartController.convertToCartItem(product, 1);
      cartController.addOneToCart(cartItem);
    }, child: Obx(() {
      final productquantity =
          cartController.getProductQuantityInCart(product.id);
      return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: SizedBox(
            width: 16 * 1.2,
            height: 16 * 1.2,
            child: Icon(
              Iconsax.add,
              color: Colors.white,
            )),
      );
    }));
  }
}

