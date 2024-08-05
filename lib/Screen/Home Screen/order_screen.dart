import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  ProductModel productModel;
  OrderScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    double sum = productModel.price + 5 + 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Review',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 219, 220),
                           
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(productModel.images ?? ''),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           
                          Row(children: [ Row(children: [Text(
                            productModel.brand!.name,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 4.sp,),
                          Icon(Iconsax.verify5, color: Colors.blue),],),]),
                          Text(
                            productModel.title,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Have a promo code ? Enter here",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _rowDisplay(
                          value: "Subtotal",
                          price: productModel.price.toString()),
                      SizedBox(
                        height: 5.sp,
                      ),
                      _rowDisplay(value: "Shipping Fee", price: "5"),
                      SizedBox(
                        height: 5.sp,
                      ),
                      _rowDisplay(value: "Tax Fee", price: "3"),
                      SizedBox(
                        height: 5.sp,
                      ),
                      _rowDisplay(
                          value: "Order",
                          price: sum.toString(),
                          fontweight: FontWeight.w600,
                          size: 18),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5.sp,
                      ),
                      _rowDisplay(
                          value: "Payment Method",
                          price: "",
                          fontweight: FontWeight.w600,
                          size: 20),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Icon(Iconsax.money),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Text(
                                'Cash on Delivery',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              )
                            ],
                          )),
                      Divider(),
                      SizedBox(
                        height: 5.sp,
                      ),
                      _rowDisplay(
                          value: "Shipping Address",
                          price: "",
                          fontweight: FontWeight.w600,
                          size: 20),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "Shital",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      _iconDisplay(
                          icon: Icon(
                            Iconsax.call,
                            color: Colors.green,
                          ),
                          name: "9453230672"),
                      SizedBox(
                        height: 4.sp,
                      ),
                      _iconDisplay(
                          icon: Icon(Iconsax.location, color: Colors.green),
                          name: "Ghazipur"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text("Place Order"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconDisplay({required Icon icon, required String name}) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 5.sp,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
  
  Widget _rowDisplay(
      {required String value,
      required String price,
      double size = 15,
      FontWeight fontweight = FontWeight.w400}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: size, fontWeight: fontweight),
        ),
        Text(
          price,
          style: TextStyle(fontSize: size, fontWeight: fontweight),
        )
      ],
    );
  }
}
