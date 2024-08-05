import 'package:flutter/rendering.dart';

class ShadowStyle {
  static final VerticalProductShadow = BoxShadow(
      color: Color(0xff2196f3).withOpacity(.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));
}
