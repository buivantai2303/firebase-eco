import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import '../mocks.mocks.dart'; // Adjust the import based on your mock file structure

void main() {
  group('CategoryModel', () {
    test('fromSnapshot creates CategoryModel instance from DocumentSnapshot', () {
      // Test case 1: All fields provided
      final mockData1 = {
        'Name': 'Electronics',
        'Image': 'electronics_image_url',
        'ParentId': 'parent_id',
        'IsFeatured': true,
      };
      final documentSnapshot1 = MockDocumentSnapshot<Map<String, dynamic>>();
      when(documentSnapshot1.id).thenReturn('category_id');
      when(documentSnapshot1.data()).thenReturn(mockData1);

      final category1 = CategoryModel.fromSnapshot(documentSnapshot1);

      expect(category1.id, 'category_id');
      expect(category1.name, 'Electronics');
      expect(category1.image, 'electronics_image_url');
      expect(category1.parentId, 'parent_id');
      expect(category1.isFeatured, true);
    });

    test('fromSnapshot handles missing fields with defaults', () {
      // Test case 2: Some fields missing
      final mockData2 = {
        'Name': 'Electronics',
        'Image': 'electronics_image_url',
      };
      final documentSnapshot2 = MockDocumentSnapshot<Map<String, dynamic>>();
      when(documentSnapshot2.id).thenReturn('category_id');
      when(documentSnapshot2.data()).thenReturn(mockData2);

      final category2 = CategoryModel.fromSnapshot(documentSnapshot2);

      expect(category2.id, 'category_id');
      expect(category2.name, 'Electronics');
      expect(category2.image, 'electronics_image_url');
      expect(category2.parentId, ''); // Default value
      expect(category2.isFeatured, false); // Default value
    });

    test('fromSnapshot returns empty CategoryModel for empty data', () {
      // Test case 3: Empty data
      final documentSnapshot3 = MockDocumentSnapshot<Map<String, dynamic>>();
      when(documentSnapshot3.id).thenReturn('category_id');
      when(documentSnapshot3.data()).thenReturn({});

      final category3 = CategoryModel.fromSnapshot(documentSnapshot3);

      expect(category3.id, 'category_id'); // Document ID should still be set
      expect(category3.name, '');
      expect(category3.image, '');
      expect(category3.parentId, '');
      expect(category3.isFeatured, false);
    });

    test('toJson converts CategoryModel instance to JSON', () {
      // Test case 4: Converting CategoryModel to JSON
      final category = CategoryModel(
        id: 'category_id',
        name: 'Electronics',
        image: 'electronics_image_url',
        parentId: 'parent_id',
        isFeatured: true,
      );

      final json = category.toJson();

      expect(json['Name'], 'Electronics');
      expect(json['Image'], 'electronics_image_url');
      expect(json['ParentId'], 'parent_id');
      expect(json['IsFeatured'], true);
    });

    test('toJson converts CategoryModel with default fields to JSON', () {
      // Test case 5: Converting CategoryModel with default fields to JSON
      final category = CategoryModel(
        id: 'category_id',
        name: 'Home Appliances',
        image: 'home_appliances_image_url',
        isFeatured: false,
      );

      final json = category.toJson();

      expect(json['Name'], 'Home Appliances');
      expect(json['Image'], 'home_appliances_image_url');
      expect(json['ParentId'], ''); // Default value
      expect(json['IsFeatured'], false);
    });
  });
}
