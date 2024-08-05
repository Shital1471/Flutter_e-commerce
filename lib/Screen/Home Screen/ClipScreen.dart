import 'package:e_commerce_app/Util/circularContainer.dart';
import 'package:e_commerce_app/Util/customecurve.dart';
import 'package:flutter/material.dart';

class ClipScreen extends StatelessWidget {
  final Widget child;
  double height;
  ClipScreen({super.key, required this.child,this.height=300});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: Color(0xFF7BA697),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: CircularContainer(
                    background: Colors.white.withOpacity(0.1),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: CircularContainer(
                      background: Colors.white.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
