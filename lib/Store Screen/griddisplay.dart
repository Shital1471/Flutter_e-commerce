import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GridDisplays extends StatelessWidget {
  final String title;
  
  GridDisplays({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  'assets/Image/shopping-bag.png',
                  height: 120,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                20.heightBox,
                title.text
                    .color(Colors.black)
                    .maxFontSize(20)
                    .align(TextAlign.center)
                    .make()
              ],
            ).box.green100.rounded.clip(Clip.antiAlias).outerShadowMd.make();
          }),
    ));
  }
}
