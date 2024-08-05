import 'package:e_commerce_app/Product_lists/Widget/cart_page.dart';
import 'package:e_commerce_app/data/Controllers/cart_controller.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomNavigationBar extends StatelessWidget {
  final ProductModel productModel;
  TBottomNavigationBar({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.sp),
        topRight: Radius.circular(16.sp),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() =>Row(
            children: [
              InkWell(
                onTap: () => controller.productQuantityInCart.value < 1
                    ? null
                    : controller.productQuantityInCart.value -= 1,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  child: Icon(Iconsax.minus),
                ),
              ),
              SizedBox(
                width: 16.sp,
              ),
              Text(
                controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                width: 16.sp,
              ),
              InkWell(
                onTap: () => controller.productQuantityInCart.value += 1,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Iconsax.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),),
          ElevatedButton(
              onPressed: () {
                controller.productQuantityInCart.value < 1
                    ? null
                    : controller.addToCart(productModel);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10.sp),
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.white)),
              child: Text(
                " Add to cart",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
