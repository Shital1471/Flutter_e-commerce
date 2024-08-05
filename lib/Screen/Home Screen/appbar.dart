import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  SAppBar(
      {super.key,
      this.title,
       this.showBackArrow=false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
            title: title,
            actions: action,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
