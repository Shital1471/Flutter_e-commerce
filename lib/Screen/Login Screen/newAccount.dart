import 'package:e_commerce_app/Util/validation.dart';
import 'package:e_commerce_app/data/Controllers/singup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Let's create your account",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Form(
              key: controller.signupFormKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstName,
                          expands: false,
                          validator: (value) =>
                              Validator.validateEmptyText("First Name", value),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "First Name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastName,
                          expands: false,
                          validator: (value) =>
                              Validator.validateEmptyText("Last Name", value),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "Last Name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  TextFormField(
                    maxLines: 1,
                    validator: (value) =>
                        Validator.validateEmptyText("username", value),
                    controller: controller.username,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.verified_user),
                        labelText: 'UserName',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
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
                    height: 10.sp,
                  ),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => Validator.validatePhoneNumber(value),
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Phone',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Obx(()=>
                    TextFormField(
                      maxLines: 1,
                      validator: (value) => Validator.validatePassword(value),
                      controller: controller.password,
                      keyboardType: TextInputType.emailAddress,
                      obscureText:controller.hidePassword.value,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                         
                          labelText: 'password',
                          suffixIcon: IconButton(onPressed:()=>controller.hidePassword.value=!controller.hidePassword.value ,
                          icon:Icon(controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "I agree to  "),
                        TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: " and "),
                        TextSpan(
                            text: "Terms of use",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ))
                      ]))
                    ],
                  ),
                  SizedBox(
                    height: 14.sp,
                  ),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.signup();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7BA697)),
                        child: Text(
                          'Sign In',
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
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
                      fontSize: 15.sp,
                      color: Colors.black54,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/Image/google.png"),
                          fit: BoxFit.cover)),
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
          ]),
        ),
      ),
    );
  }
}
