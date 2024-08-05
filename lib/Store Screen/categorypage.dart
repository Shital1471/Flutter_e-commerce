import 'package:e_commerce_app/Image%20Data/datadisplay.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/appbar.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/featured_button.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/gridview_builder.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/product_card_vertical.dart';
import 'package:e_commerce_app/Screen/Home%20Screen/searchbar.dart';
import 'package:e_commerce_app/Store%20Screen/griddisplay.dart';
import 'package:e_commerce_app/Store%20Screen/tabbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 5,
      child: Scaffold(
       
        appBar: AppBar(
         
          automaticallyImplyLeading: false,
          title: Text('Store',style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold
          ),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag,color: Colors.black,size: 30,))
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 350,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      SearchBars(),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Brand",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                2,
                                (index) => Column(
                                      children: [
                                        // FeaturedButton(brand[index],true),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        // FeaturedButton(brand[index+2],true),
                                      ],
                                    ))),
                      ),
                    ],
                  ),
                ),
                bottom: STabBars(
                  tabs: [
                    Tab(
                      child: Text('Sports',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    Tab(
                      child: Text('Furniture',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    Tab(
                      child: Text('Electronics',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    Tab(
                      child: Text('Cloths',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    Tab(
                      child: Text('Cosmetics',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
           Padding(
             padding: const EdgeInsets.all(15.0),
            //  child: GridLayout(itemCount: sports.length, itemBuilder: (_,index)=>  ProductCardVertical(url: sports[index],),),
           ),
           Padding(
              padding: const EdgeInsets.all(15.0),
            //  child: GridLayout(itemCount: Furniture.length, itemBuilder: (_,index)=>  ProductCardVertical(url: Furniture[index],),),
           ),
          Padding(
              padding: const EdgeInsets.all(15.0),
            //  child: GridLayout(itemCount: Electronics.length, itemBuilder: (_,index)=>  ProductCardVertical(url: Electronics[index],),),
           ),
          Padding(
             padding: const EdgeInsets.all(15.0),
            //  child: GridLayout(itemCount: Cloths.length, itemBuilder: (_,index)=>  ProductCardVertical(url: Cloths[index],),),
           ),
           Padding(
             padding: const EdgeInsets.all(15.0),
            //  child: GridLayout(itemCount: Cosmetics.length, itemBuilder: (_,index)=>  ProductCardVertical(url: Cosmetics[index],),),
           ),
          ]),
        ),
      ),
    );
  }
}
