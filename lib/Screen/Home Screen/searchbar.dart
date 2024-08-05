import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5.sp,
            ),
            Text(
              "search in store...",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
