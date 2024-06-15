import 'package:firebase_eco/features/shop/models/product_category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../brand_test/brand_model.test.dart';

void main() {
  group('ProductCategoryModel', () {
    test('fromSnapshot creates ProductCategoryModel instance from DocumentSnapshot', () {
      // Mock data for DocumentSnapshot
      final mockData = {
        'productId': 'product_id',
        'categoryId': 'category_id',
      };

      // Create a mock DocumentSnapshot
      final documentSnapshot = MockDocumentSnapshot(); // Using your generated mock
      when(documentSnapshot.data()).thenReturn(mockData);

      // Call fromSnapshot factory constructor
      final productCategory = ProductCategoryModel.fromSnapshot(documentSnapshot);

      // Verify the created ProductCategoryModel instance
      expect(productCategory.productId, 'product_id');
      expect(productCategory.categoryId, 'category_id');
    });

    test('toJson converts ProductCategoryModel instance to JSON', () {
      // Create a ProductCategoryModel instance
      final productCategory = ProductCategoryModel(
        productId: 'product_id',
        categoryId: 'category_id',
      );

      // Call toJson method
      final json = productCategory.toJson();

      // Verify the converted JSON
      expect(json['productId'], 'product_id');
      expect(json['categoryId'], 'category_id');
    });


  });
}
