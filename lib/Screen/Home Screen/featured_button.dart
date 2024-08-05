import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget FeaturedButton(String url, bool brand ,String name) {
  return Container(
    margin: EdgeInsets.only(top: 1.sp, bottom: 1.sp, left: 5.sp, right: 5.sp),
    padding: EdgeInsets.all(8.sp),
    width: 200,
    height: 70,
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 5.sp,
        ),
        brand
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     name,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text('No of products',style: TextStyle(color: Colors.black),)
                  ],
                ),
              )
            : Text(
                "Categories Name",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
      ],
    ),
  );
}
