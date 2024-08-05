import "package:e_commerce_app/Product_lists/Widget/ImagePrdouct.dart";
import "package:e_commerce_app/Product_lists/Widget/bootom_navigatiion_bar.dart";
import "package:e_commerce_app/Product_lists/Widget/choices_chip.dart";
import "package:e_commerce_app/Product_lists/Widget/product_metadata.dart";
import "package:e_commerce_app/Product_lists/Widget/rating_share.dart";
import "package:e_commerce_app/Screen/Home%20Screen/ClipScreen.dart";
import "package:e_commerce_app/Screen/Home%20Screen/order_screen.dart";
import "package:e_commerce_app/Util/customecurve.dart";
import "package:e_commerce_app/data/Model/product_model.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:readmore/readmore.dart";

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomNavigationBar(productModel: productModel),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageProduct(imgPath: productModel.images ?? ''),
            Padding(
              padding: EdgeInsets.only(right: 16.sp, left: 16.sp, bottom: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingShare(),
                  ProductMetaData(
                    price: productModel.salePrice.toString(),
                    discount: "",
                    title: productModel.title,
                    isStock: productModel.stock,
                    brandName: productModel.brand!.name,
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Colors",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text("view All")
                        ],
                      ),
                      Wrap(
                        children: [
                          TChoiceChip(
                              text: "Green", selected: true, isColors: true),
                          TChoiceChip(
                              text: "Green", selected: false, isColors: true),
                          TChoiceChip(
                              text: "Green", selected: false, isColors: true),
                          TChoiceChip(
                              text: "Green", selected: false, isColors: true),
                          TChoiceChip(
                              text: "Green", selected: false, isColors: true),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text("view All")
                        ],
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          TChoiceChip(
                              text: "XS", selected: true, isColors: false),
                          TChoiceChip(
                              text: "S", selected: false, isColors: false),
                          TChoiceChip(
                              text: "M", selected: false, isColors: false),
                          TChoiceChip(
                              text: "L", selected: false, isColors: false),
                          TChoiceChip(
                              text: "XL", selected: false, isColors: false),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  // check out
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => OrderScreen(productModel: productModel,));
                          },
                          child: Text("Check Out"))),
                  SizedBox(
                    height: 8.sp,
                  ),
                  // Description
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  ReadMoreText(
                    productModel.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Divider(),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews(199)",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            size: 24,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
