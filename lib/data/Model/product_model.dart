

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/Model/brand_model.dart';
import 'package:e_commerce_app/data/Model/product_attribute_model.dart';
import 'package:e_commerce_app/data/Model/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  // DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  String? images;
  String productType;
  

  ProductModel({
    required this.id,
    required this.title,
    this.sku,
    required this.price,
    // required this.date,
    this.brand,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.description,
    this.categoryId,
    this.images,
    this.isFeatured,
    required this.stock,
    required this.productType,
   
  });

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? '',
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.tojson(),
      'Description': description,
      'ProductType': productType,
      
    };
  }

  static ProductModel empty() => ProductModel(
      id: '', title: '', price: 0, thumbnail: '', stock: 0, productType: '');

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (data.isEmpty) return ProductModel.empty();
    return ProductModel(
        id: document.id,
        title: data['Title'],
        sku: data['SKU'],
        price: double.parse((data['Price'] ?? 0.0).toString()),
        brand: BrandModel.fromJson(data['Brand']),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        description: data['Description'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        images: data['Images'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        stock: data['Stock'] ?? 0,
        productType: data['ProductType'] ?? '',
       );
  }
}
