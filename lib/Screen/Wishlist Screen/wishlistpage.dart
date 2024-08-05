import 'package:e_commerce_app/Image%20Data/datadisplay.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/appbar.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/gridview_builder.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/homepage.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/product_card_vertical.dart';
import 'package:e_commerce_app/data/Controllers/favourite_controller.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Wishlist',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.add,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Obx(() => FutureBuilder(
            future: controller.favoriteProducts(),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final products = snapshot.data!;
                return GridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => ProductCardVertical(
                    productModel: products[index],
                  ),
                );
              }
            },
          ),)
        ),
      ),
    );
  }
}
