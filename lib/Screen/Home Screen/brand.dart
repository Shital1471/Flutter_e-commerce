import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class BrandWidget extends StatelessWidget {
  String title;
  IconData icon;
  Color colors;
  BrandWidget({super.key, required this.title, required this.icon,required this.colors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            child: Icon(
              icon,
              size: 30.sp,
              color: colors,
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
