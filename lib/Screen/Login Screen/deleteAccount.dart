import 'package:e_commerce_app/data/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Util/validation.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Re-Authentication User',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    controller: controller.verifyEmail,
                    validator: (value) => Validator.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Obx(
                    () => TextFormField(
                      maxLines: 1,
                      controller: controller.verifyPassword,
                      obscureText: controller.hidePassword.value,
                      validator: (value) =>
                          Validator.validateEmptyText("Password", value),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: 'Password',
                        suffixIcon: Obx(
                          () => IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.sp),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue
                        ),
                          onPressed: () =>
                              controller.reAuthenticateEmailAndPassword(),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text('Verify',style: TextStyle(color: Colors.white),),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
