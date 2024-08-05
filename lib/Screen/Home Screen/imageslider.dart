import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  final String imgurl;
  final bool NetworkUrl;
  
  ImageSlider({super.key, required this.imgurl, this.NetworkUrl = false});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 198,
     width: double.infinity,  
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(
          image: NetworkUrl
              ? NetworkImage(imgurl)
              : AssetImage(imgurl) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
