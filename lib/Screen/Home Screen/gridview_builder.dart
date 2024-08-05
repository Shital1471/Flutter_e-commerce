import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridLayout extends StatelessWidget {
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  GridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 288,
        mainAxisSpacing: 16.sp,
        crossAxisSpacing: 16.sp,
      ) , 
      itemBuilder: itemBuilder);
  }
}
