import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_eco/features/shop/models/brand_category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'brand_model.test.dart';

void main() {
  group('BrandCategoryModel', () {
    test('fromJson creates BrandCategoryModel instance from DocumentSnapshot', () {
      // Mock data for DocumentSnapshot
      final mockData = {
        'brandId': 'brand_id',
        'categoryId': 'category_id',
      };

      // Create a mock DocumentSnapshot
      final documentSnapshot = MockDocumentSnapshot();
      when(documentSnapshot.data()).thenReturn(mockData);

      // Call fromSnapshot factory constructor
      final brandCategory = BrandCategoryModel.fromSnapshot(documentSnapshot);

      // Verify the created BrandCategoryModel instance
      expect(brandCategory.brandId, 'brand_id');
      expect(brandCategory.categoryId, 'category_id');
    });




    test('toJson converts BrandCategoryModel instance to JSON', () {
      // Create a BrandCategoryModel instance
      final brandCategory = BrandCategoryModel(
        brandId: 'brand_id',
        categoryId: 'category_id',
      );

      // Call toJson method
      final json = brandCategory.toJson();

      // Verify the converted JSON
      expect(json['brandId'], 'brand_id');
      expect(json['categoryId'], 'category_id');
    });


  });
}
