import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RatingShare extends StatelessWidget {
  const RatingShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
              width: 8.sp,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(199)')
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              size: 24.sp,
            ))
      ],
    );
  }
}
