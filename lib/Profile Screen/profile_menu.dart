import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  String title;
  String name;
ProfileMenu({super.key,required this.title,required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16 / 1.5),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
            flex: 5,
            child: Text(
             name,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
            child: Icon(
          Iconsax.arrow_right_34,
          size: 18,
          color: Colors.black,
        ))
      ]),
    );
  }
}
