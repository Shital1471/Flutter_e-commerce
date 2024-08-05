import 'package:e_commerce_app/Product_lists/Widget/cart_page.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/homepage.dart';
import 'package:e_commerce_app/Screen/Wishlist%20Screen/wishlistpage.dart';
import 'package:e_commerce_app/Store%20Screen/categorypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Profile Screen/setting_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller=Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
      () => NavigationBar(height: 80, elevation: 0,
      selectedIndex: Controller.selectedIndex.value,
      onDestinationSelected: (index)=> Controller.selectedIndex.value=index,
       destinations: [
        NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
        NavigationDestination(icon: Icon(Iconsax.bag), label: 'Cart'),
        NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
        NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
      ]),
    ),
    body: Obx(()=> Controller.screen[Controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final screen = [
    HomePage(),
    CartPage(),
    FavouriteScreen(),
    SettingScreen()
    
    
  ];
}
