import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_eco/features/shop/models/brand_model.dart';
import 'package:firebase_eco/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_eco/utils/exceptions/format_exceptions.dart';
import 'package:firebase_eco/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> fetchAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final list = snapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

  /// Get Brands for a specific category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      List<dynamic> brandIds =
          brandCategoryQuery.docs.map((doc) => doc.get('brandId')).toList();
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Get all brands
  Future<List<BrandModel>> fetchFeaturedBrands() async {
    try {
      final snapshot = await _db.collection('Brands').limit(4).get();

      final list = snapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

  /// Upload Brands to the Cloud
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);
        final url = await storage.uploadImageData('Brands', file, brand.name);
        brand.image = url;
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
