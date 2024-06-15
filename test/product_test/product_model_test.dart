import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_eco/features/shop/models/product_model.dart';
import 'package:firebase_eco/features/shop/models/brand_model.dart';
import 'package:firebase_eco/features/shop/models/product_attribute_model.dart';
import 'package:firebase_eco/features/shop/models/product_variation_model.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Mock class for DocumentSnapshot
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Map<String, dynamic>> {}

void main() {
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockDocumentSnapshot = MockDocumentSnapshot();
  });



  test('ProductModel.toJson() correctly converts model to JSON', () {
    // Create a product model
    final product = ProductModel(
      id: 'product123',
      sku: 'ABC123',
      title: 'Sample Product',
      stock: 10,
      price: 99.99,
      thumbnail: 'thumbnail.jpg',
      salePrice: 79.99,
      isFeatured: true,
      categoryId: 'category123',
      description: 'Sample description',
      productType: 'simple',
      brand: BrandModel(
        id: 'brand123',
        name: 'Sample Brand',
        image: 'logo.png',
        productsCount: 100,
        isFeatured: true,
      ),
      images: ['image1.jpg', 'image2.jpg'],
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['Medium']),
        ProductAttributeModel(name: 'Color', values: ['Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'variation1',
          image: 'variation1.jpg',
          description: 'Variation 1',
          price: 49.99,
          salePrice: 39.99,
          stock: 5,
          sku: 'VAR123',
          attributeValues: {'Size': 'Medium', 'Color': 'Blue'},
        ),
      ],
    );

    // Convert to JSON
    final json = product.toJson();

    // Verify JSON properties
    expect(json['SKU'], 'ABC123');
    expect(json['Title'], 'Sample Product');
    expect(json['Stock'], 10);
    expect(json['Price'], 99.99);
    expect(json['Images'], ['image1.jpg', 'image2.jpg']);
    expect(json['Thumbnail'], 'thumbnail.jpg');
    expect(json['SalePrice'], 79.99);
    expect(json['IsFeatured'], true);
    expect(json['CategoryId'], 'category123');
    expect(json['Brand'], isNotNull);
    expect(json['Brand']['Id'], 'brand123');
    expect(json['Brand']['Name'], 'Sample Brand');
    expect(json['Brand']['Image'], 'logo.png');
    expect(json['Brand']['ProductsCount'], 100);
    expect(json['Brand']['IsFeatured'], true);
    expect(json['Description'], 'Sample description');
    expect(json['ProductType'], 'simple');
    expect(json['ProductAttributes'].length, 2);
    expect(json['ProductAttributes'][0]['Name'], 'Size');
    expect(json['ProductAttributes'][0]['Values'], ['Medium']);
    expect(json['ProductAttributes'][1]['Name'], 'Color');
    expect(json['ProductAttributes'][1]['Values'], ['Blue']);
    expect(json['ProductVariations'].length, 1);
    expect(json['ProductVariations'][0]['Id'], 'variation1');
    expect(json['ProductVariations'][0]['SKU'], 'VAR123');
    expect(json['ProductVariations'][0]['Image'], 'variation1.jpg');
    expect(json['ProductVariations'][0]['Description'], 'Variation 1');
    expect(json['ProductVariations'][0]['Price'], 49.99);
    expect(json['ProductVariations'][0]['SalePrice'], 39.99);
    expect(json['ProductVariations'][0]['Stock'], 5);
    expect(json['ProductVariations'][0]['AttributeValues']['Size'], 'Medium');
    expect(json['ProductVariations'][0]['AttributeValues']['Color'], 'Blue');
  });

  test('ProductModel.empty() returns an empty product model', () {
    // Create an empty product model
    final emptyProduct = ProductModel.empty();

    // Verify the properties are all set to default empty values
    expect(emptyProduct.id, '');
    expect(emptyProduct.title, '');
    expect(emptyProduct.stock, 0);
    expect(emptyProduct.price, 0);
    expect(emptyProduct.thumbnail, '');
    expect(emptyProduct.productType, '');
    expect(emptyProduct.sku, isNull);
    expect(emptyProduct.brand, isNull);
    expect(emptyProduct.date, isNull);
    expect(emptyProduct.images, isNull);
    expect(emptyProduct.salePrice, 0.0);
    expect(emptyProduct.isFeatured, isNull);
    expect(emptyProduct.categoryId, isNull);
    expect(emptyProduct.description, isNull);
    expect(emptyProduct.productAttributes, isNull);
    expect(emptyProduct.productVariations, isNull);
  });

}
