import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks.mocks.dart';
import 'package:firebase_eco/features/shop/models/banner_model.dart';

void main() {
  group('BannerModel', () {
    test('fromJson creates BannerModel instance from DocumentSnapshot', () {

      final mockData = {
        'ImageUrl': 'banner_image_url',
        'TargetScreen': 'target_screen',
        'Active': true,
      };

      final documentSnapshot = MockDocumentSnapshot();
      when(documentSnapshot.data()).thenReturn(mockData);

      // Call fromSnapshot factory constructor
      final banner = BannerModel.fromSnapshot(documentSnapshot);

      // Verify the created BannerModel instance
      expect(banner.imageUrl, 'banner_image_url');
      expect(banner.targetScreen, 'target_screen');
      expect(banner.active, true);
    });

    test('toJson converts BannerModel instance to JSON', () {
      // Create a BannerModel instance
      final banner = BannerModel(
        imageUrl: 'banner_image_url',
        targetScreen: 'target_screen',
        active: true,
      );

      // Call toJson method
      final json = banner.toJson();

      // Verify the converted JSON
      expect(json['ImageUrl'], 'banner_image_url');
      expect(json['TargetScreen'], 'target_screen');
      expect(json['Active'], true);
    });
  });
}
