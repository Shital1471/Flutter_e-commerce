class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  // int? productsCount;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    // this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  tojson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
    
      'IsFeatured': isFeatured
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isNotEmpty) {
      return BrandModel(
          id: data['Id'] ?? '',
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
        
          isFeatured: data['IsFeatured'] ?? '');
    } else {
      return BrandModel.empty();
    }
  }
}
