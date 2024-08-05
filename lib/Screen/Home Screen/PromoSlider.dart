import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Get%20folder/homepageGet.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/imageslider.dart';
import 'package:e_commerce_app/data/Controllers/banner_controller.dart';
import 'package:e_commerce_app/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PromoImageSlider extends StatelessWidget {
  PromoImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value)
        return ShimmerEffect(
          width: double.infinity,
          height: 198,
        );
      if (controller.banner.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      }
      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banner
                  .map((url) => ImageSlider(
                        imgurl: url.imageUrl,
                        NetworkUrl: true,
                      ))
                  .toList()),
                  SizedBox(
                    height: 10.sp,
                  ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banner.length; i++)
                    Container(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 4.sp),
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: controller.carousalCurrentIndex.value == i
                              ? Color(0xFFF3B790)
                              : Colors.grey),
                    ),
                  SizedBox(
                    width: 5.sp,
                  ),
                ],
              ))
        ],
      );
    });
  }
}
