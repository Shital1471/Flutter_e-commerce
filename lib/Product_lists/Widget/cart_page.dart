import 'package:e_commerce_app/data/Controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart Page'),
          centerTitle: true,
        ),
        body: Obx(() => ListView.separated(
            itemCount: cartcontroller.cartItems.length,
            separatorBuilder: (_, __) => SizedBox(
                  height: 10.sp,
                ),
            itemBuilder: (_, index) => Obx(() {
                  final item = cartcontroller.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 217, 219, 220),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(item.image!),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Row(
                                            children: [
                                              Text(
                                                item.brandName!,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: 4.sp,
                                              ),
                                              Icon(Iconsax.verify5,
                                                  color: Colors.blue),
                                            ],
                                          ),
                                        ]),
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              cartcontroller.subOneToCart(item),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                            child: Icon(Iconsax.minus),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                        Text(
                                          item.quantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              cartcontroller.addOneToCart(item),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.green,
                                            ),
                                            child: Icon(
                                              Iconsax.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '₹8909',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }))));
  }
}
