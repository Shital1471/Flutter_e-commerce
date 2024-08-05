import 'package:e_commerce_app/Product_lists/Widget/cart_page.dart';
import 'package:e_commerce_app/Profile%20Screen/profilescreen.dart';
import 'package:e_commerce_app/Profile%20Screen/settings_menu_title.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/ClipScreen.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/appbar.dart';
import 'package:e_commerce_app/data/Repository/authentication_repository.dart';
import 'package:e_commerce_app/data/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipScreen(
              height: 200,
              child: Column(
                children: [
                  SAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/Image/shopping-bag.png'),
                              fit: BoxFit.cover)),
                    ),
                    title: Text(
                      controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                    subtitle: Text(
                      controller.user.value.email,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProfileScreen()));
                        },
                        icon: Icon(
                          Iconsax.edit,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 8.sp),
              SettingsMenuTile(
                icon: Iconsax.safe_home,
                title: 'My Addresses',
                subtitle: 'Set shopping delivery address',
                onTap: () {},
              ),
              SettingsMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'My Cart',
                subtitle: 'Add, remove product and move to checkout',
                onTap: () {
                  Get.to(() => CartPage());
                },
              ),
              SettingsMenuTile(
                icon: Iconsax.bag_tick,
                title: 'My Orders',
                subtitle: 'In-progress and Completed Orders',
                onTap: () {},
              ),
              SettingsMenuTile(
                icon: Iconsax.bank,
                title: 'Bank Account',
                subtitle: 'Withdraw balance to registered bank account',
                onTap: () {},
              ),
              SettingsMenuTile(
                icon: Iconsax.discount_shape,
                title: 'My Coupons',
                subtitle: 'List of all the discounted coupons',
                onTap: () {},
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'App Settings',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SettingsMenuTile(
                icon: Iconsax.document_upload,
                title: 'Load Data',
                subtitle: 'Upload Data to your Cloud Firebase',
                onTap: () {},
              ),
              SettingsMenuTile(
                icon: Iconsax.location,
                title: 'Geolocation',
                subtitle: 'Set recommendation based on location',
                //  trailing: Switch(value: true,onChanged: (value){},),
              ),
              SizedBox(
                height: 10.sp,
              ),
              // Logout Button
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Your button click logic here
                    AuthenticationRepository.instance.logout();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            18.0), // Adjust the border radius as needed
                        side: BorderSide(
                            color: Colors.grey), // Set the border color
                      ),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
