import 'package:e_commerce_app/Profile%20Screen/profile_menu.dart';
import 'package:e_commerce_app/Profile%20Screen/profileimages.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/imageslider.dart';

import 'package:e_commerce_app/data/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: double.infinity,
            child: Column(children: [
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty
                    ? networkImage
                    : 'assets/Image/shopping-bag.png';
                return ProfileImage(
                  url: image,
                  isaNetworkImage: networkImage.isNotEmpty,
                );
              }),
              InkWell(
                onTap: () {
                  controller.uploadUserProfilePicture();
                },
                child: Text(
                  "Change Profile picture",
                  style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Divider(),
          Text(
            "Profile Information",
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          ProfileMenu(title: "Name", name: controller.user.value.fullName),
          ProfileMenu(title: "UserName", name: controller.user.value.username),
          Divider(),
          Text(
            "Personal Information",
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          ProfileMenu(title: "User ID", name: controller.user.value.id),
          ProfileMenu(title: "E-mail", name: controller.user.value.email),
          ProfileMenu(
              title: "Phone Number", name: controller.user.value.phoneNumber),
          ProfileMenu(title: "Gender", name: "Female"),
          ProfileMenu(title: "Date Of Birth", name: "07/01/2001"),
          Divider(),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  controller.deleteAccountWarningPopup();
                },
                child: Text(
                  'Close Account',
                  style: TextStyle(fontSize: 15.sp, color: Colors.red),
                )),
          )
        ]),
      ),
    );
  }
}
