import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductMetaData extends StatelessWidget {
  String price;
  String discount;
  String title;
  String brandName;
  int isStock;
  ProductMetaData({super.key,required this.price,required this.discount,required this.title,required this.brandName,required this.isStock});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20.sp,
              width: 30.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: Colors.amber.withOpacity(0.8)),
              child: Center(
                  child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.black),
              )),
            ),
            SizedBox(
              width: 16.sp,
            ),
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 16.sp,
            ),
            Text(discount, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        SizedBox(
          height: 24.sp / 1.5,
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8.sp),
        Row(
          children: [
            Text(
              "Status",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              width: 8.sp,
            ),
            Text(
             isStock>0?"In Stock":"Out of Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              brandName,
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
      ],
    );
  }
}
