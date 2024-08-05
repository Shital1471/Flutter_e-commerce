import 'dart:developer';
import 'package:e_commerce_app/Product_lists/Widget/cart_page.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/ClipScreen.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/PromoSlider.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/appbar.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/brand.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/featured_button.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/product_grid.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/searchbar.dart';
import 'package:e_commerce_app/data/Controllers/Categories/categoriees_controller.dart';
import 'package:e_commerce_app/data/Controllers/Categories/product_controller.dart';
import 'package:e_commerce_app/data/Controllers/banner_controller.dart';
import 'package:e_commerce_app/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Image Data/datadisplay.dart';
import '../../data/Controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(UserController());
  final bannerController = Get.put(BannerController());
  final categoryController = Get.put(CategoryController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipScreen(
            child: Column(children: [
              SAppBar(
                showBackArrow: false,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good day for shopping',
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFFF7EEF1)),
                      ),
                      Obx(() => Text(
                            controller.user.value.fullName,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ]),
                action: [
                  InkWell(
                    onTap: ()=> Get.to(()=>CartPage()),
                    child: Icon(
                      Iconsax.shopping_bag,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
              // Search Bar
              SearchBars(),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5.sp, bottom: 0.sp, left: 20.sp, right: 20.sp),
                child: Row(
                  children: [
                    BrandWidget(
                      title: "Top Categories",
                      icon: Iconsax.category,
                      colors: Colors.red,
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    BrandWidget(
                      title: "Brand",
                      icon: Icons.lightbulb,
                      colors: Colors.green,
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    BrandWidget(
                      title: "Top Sellers",
                      icon: Iconsax.crown,
                      colors: Colors.yellow,
                    ),
                  ],
                ),
              )
            ]),
          ),

          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 1, right: 8, left: 8),
            child: PromoImageSlider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Feature Categories",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Obx(() {
            if (categoryController.isLoading.value)
              return ShimmerEffect(
                height: 70,
                width: 200,
              );
            if (categoryController.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  'No Data Found',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: categoryController.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = categoryController.featuredCategories[index];
                  log('$category');
                  return FeaturedButton(category.image, true, category.name);
                });
          }),
          // ProductCordVertical (),

          SizedBox(
            height: 15.sp,
          ),
          VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              itemCount: sliders.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  sliders[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(EdgeInsets.symmetric(horizontal: 8))
                    .make();
              }),
          SizedBox(
            height: 15.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Products",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'View All',
                  style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                )
              ],
            ),
          ),
          ProductGrid(),
        ]),
      ),
    );
  }
}
