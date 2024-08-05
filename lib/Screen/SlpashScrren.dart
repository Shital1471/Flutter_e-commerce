import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
  backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          Text("Splash Scrren",style: TextStyle(fontSize: 20.sp,color: Colors.black),),
          CircularProgressIndicator(color: Colors.black,)
        ]),
      ),
    );
  }
}