import 'package:e_commerce_app/Screen/Login%20Screen/newAccount.dart';
import 'package:e_commerce_app/Screen/NavigatonBar/navigatonspage.dart';
import 'package:e_commerce_app/Util/validation.dart';
import 'package:e_commerce_app/data/Controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  lgo img
                  Image(
                      height: 140,
                      image: AssetImage("assets/Image/shopping-bag.png")),

                  SizedBox(
                    height: 20.sp,
                  ),
                  // Text in app
                  Text(
                    "Welcome back,",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discover Limitless Choices and Unmatched  Convenience.',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Form(
                  key: controller.loginFromKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 1,
                        controller: controller.email,
                        validator: (value) => Validator.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Obx(() => TextFormField(
                        maxLines: 1,
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        validator: (value) =>
                            Validator.validateEmptyText("Password", value),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            labelText: 'Password',
                            suffixIcon: Obx(() => IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20))),
                      ),),
                      SizedBox(
                        height: 5.sp,
                      ),
                      // Remember Me & password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) => controller.rememberMe
                                      .value = !controller.rememberMe.value,
                                ),
                              ),
                              Text('Remember Me')
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                      // Sign button

                      SizedBox(
                        height: 50.sp,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.emailAndPasswordSignIn();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF7BA697)),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      // Create new account button
                      SizedBox(
                        height: 50.sp,
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NewAccount()));
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(fontSize: 20.sp),
                            )),
                      )
                    ],
                  )),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 60,
                    endIndent: 5,
                  )),
                  Text('Or Sign in with',
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  Flexible(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 60,
                  )),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => controller.googleSignIn(),
                    child: Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("assets/Image/google.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Container(
                    height: 30.sp,
                    width: 30.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage("assets/Image/facebook.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
