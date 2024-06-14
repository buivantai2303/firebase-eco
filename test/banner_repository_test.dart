import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_eco/features/shop/models/banner_model.dart';
import 'package:firebase_eco/data/repositories/banners/banner_reposity.dart';
import 'package:firebase_eco/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_eco/utils/exceptions/platform_exceptions.dart';

import 'banner_repository_test.mocks.dart';

void main() {
  late BannerReposity bannerRepository;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference<Map<String, dynamic>>();
    mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();

    Get.put<BannerReposity>(BannerReposity());
    bannerRepository = BannerReposity.instance;

    when(mockFirestore.collection('Banners')).thenReturn(mockCollection);
  });

  group('fetchBanners', () {
    test('returns list of BannerModel if successful', () async {
      // Arrange
      final bannerData = {
        'ImageUrl': 'http://example.com/image.jpg',
        'TargetScreen': 'details',
        'Active': true,
      };
      final mockQueryDocumentSnapshot = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      when(mockQueryDocumentSnapshot.data()).thenReturn(bannerData);
      when(mockQueryDocumentSnapshot.id).thenReturn('1');
      when(mockQueryDocumentSnapshot.exists).thenReturn(true);

      when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);
      when(mockCollection.where('Active', isEqualTo: true)).thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);

      // Act
      final banners = await bannerRepository.fetchBanners();

      // Assert
      expect(banners.length, 1);
      expect(banners.first.imageUrl, 'http://example.com/image.jpg');
      expect(banners.first.targetScreen, 'details');
      expect(banners.first.active, true);
    });

    // Additional test cases can be added here for handling exceptions
  });
}
