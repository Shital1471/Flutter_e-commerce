import 'package:flutter/material.dart';

class STabBars extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  STabBars({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Material(
     
      child: TabBar(
        
          isScrollable: true,
          indicatorColor: Colors.green,
          unselectedLabelColor: Colors.black,
          labelColor: Color(0xFFD08FA5),
          tabs:tabs
          ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
