

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String? image;
  int? productsCount;
  bool? isFeatured;

  BrandModel ({
    required this.id,
    required this.name,
    this.image,
    this.productsCount,
    this.isFeatured,
});

  static BrandModel empty() => BrandModel(id: '', name: '', image: '', productsCount: 0, isFeatured: false);

  toJson() {
    return {
      'Id': id,
      "Name": name,
      'Image': image,
      'ProductsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return BrandModel.empty();
    return BrandModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      productsCount: data['ProductsCount'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
    );
  }

}