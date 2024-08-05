import 'package:e_commerce_app/Util/customecurve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ImageProduct extends StatelessWidget {
  final String imgPath;
 ImageProduct({super.key,required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CustomCurvedEdges(),
        child: Container(
          color: Colors.grey,
          child: Stack(children: [
            SizedBox(
                // height: 400,
                child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Image(
                        image: NetworkImage(imgPath),fit: BoxFit.cover,))),
            Positioned(
                right: 0,
                bottom: 30,
                left: 16,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(
                            width: 16.sp,
                          ),
                      itemCount: 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => GestureDetector(
                            child: Container(
                              width: 80,
                              height: 80,
                            
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              child: Image(
                                image:
                                   NetworkImage(imgPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                )),
            Positioned(
                top: 10.sp,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Iconsax.arrow_left)))
          ]),
        ));
  }
}
