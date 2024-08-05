import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  String url;
  bool isaNetworkImage;
  ProfileImage({super.key, this.isaNetworkImage = false, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isaNetworkImage
              ? CachedNetworkImage(
                  fit: BoxFit.cover,
                  color: Colors.grey,
                  imageUrl: url,
                  // progressIndicatorBuilder: (context,url,downloadProgress)=> ,
                  errorWidget: (context, url, error) => Icon(Icons.error))
              : Image(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
