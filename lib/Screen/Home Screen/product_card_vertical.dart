import 'package:e_commerce_app/Screen/Home%20Screen/imageslider.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/product_details.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/productcartadd_cart.dart';
import 'package:e_commerce_app/Screen/add_wishlist.dart';
import 'package:e_commerce_app/Util/box_shadow.dart';
import 'package:e_commerce_app/data/Controllers/cart_controller.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  ProductModel productModel;
  ProductCardVertical({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(
            productModel: productModel,
          )),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          boxShadow: [ShadowStyle.VerticalProductShadow],
          borderRadius: BorderRadius.circular(20.sp),
          color: Color(0xFFF7EEF1),
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(productModel.images!),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                      top: 2,
                      right: 5,
                      child: AddWishList(
                        productId: productModel.id,
                      )),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  children: [
                    Text(
                      productModel.brand!.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Icon(Iconsax.verify5, color: Colors.blue),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productModel.salePrice.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: SizedBox(
                          width: 30.sp,
                          height: 30.sp,
                          child: Center(
                              child: ProductCartAddToCrtButton(
                                  product: productModel)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
