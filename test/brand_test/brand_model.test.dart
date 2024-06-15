import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_eco/features/shop/models/brand_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


// Mock setup
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Map<String, dynamic>> {}

void main() {
  group('BrandModel', () {
    test('fromJson creates BrandModel instance from JSON', () {
      // Mock data for JSON
      final mockData = {
        'Id': 'brand_id',
        'Name': 'Test Brand',
        'Image': 'brand_image.jpg',
        'ProductsCount': 10,
        'IsFeatured': true,
      };

      // Call fromJson factory constructor
      final brand = BrandModel.fromJson(mockData);

      // Verify the created BrandModel instance
      expect(brand.id, 'brand_id');
      expect(brand.name, 'Test Brand');
      expect(brand.image, 'brand_image.jpg');
      expect(brand.productsCount, 10);
      expect(brand.isFeatured, true);
    });

    test('fromJson handles empty data', () {
      // Call fromJson with empty data
      final brand = BrandModel.fromJson({});

      // Verify the created BrandModel instance is empty
      expect(brand.id, '');
      expect(brand.name, '');
      expect(brand.image, '');
      expect(brand.productsCount, 0);
      expect(brand.isFeatured, false);
    });
    

    test('toJson converts BrandModel instance to JSON', () {
      // Create a BrandModel instance
      final brand = BrandModel(
        id: 'brand_id',
        name: 'Test Brand',
        image: 'brand_image.jpg',
        productsCount: 10,
        isFeatured: true,
      );

      // Call toJson method
      final json = brand.toJson();

      // Verify the converted JSON
      expect(json['Id'], 'brand_id');
      expect(json['Name'], 'Test Brand');
      expect(json['Image'], 'brand_image.jpg');
      expect(json['ProductsCount'], 10);
      expect(json['IsFeatured'], true);
    });

    test('toJson handles null fields', () {
      // Create a BrandModel instance with null fields
      final brand = BrandModel.empty();

      // Call toJson method
      final json = brand.toJson();

      // Verify the converted JSON has default values for null fields
      expect(json['Id'], '');
      expect(json['Name'], '');
      expect(json['Image'], '');
      expect(json['ProductsCount'], 0);
      expect(json['IsFeatured'], false);
    });
  });
}
