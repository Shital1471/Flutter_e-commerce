import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Color background;
  final Widget? child;

  CircularContainer(
      {super.key,
      this.width=400,
      this.height=400,
      this.radius=400,
      this.padding=0,
      required this.background,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: background
      ),
      child: child,
    );
  }
}
