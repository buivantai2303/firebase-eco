import 'package:firebase_eco/features/shop/models/product_variation_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../mocks.mocks.dart';

void main() {
  group('ProductVariationModel', () {
    test('fromJson creates ProductVariationModel instance from JSON', () {
      final mockData = {
        'Id': 'variation_id',
        'SKU': 'ABC123-01',
        'Image': 'variation_image.jpg',
        'Description': 'Test variation',
        'Price': 99.99,
        'SalePrice': 79.99,
        'Stock': 5,
        'AttributeValues': {
          'Size': 'M',
          'Color': 'Red',
        },
      };

      final variation = ProductVariationModel.fromJson(mockData);

      expect(variation.id, 'variation_id');
      expect(variation.sku, 'ABC123-01');
      expect(variation.image, 'variation_image.jpg');
      expect(variation.description, 'Test variation');
      expect(variation.price, 99.99);
      expect(variation.salePrice, 79.99);
      expect(variation.stock, 5);
      expect(variation.attributeValues.length, 2);
      expect(variation.attributeValues['Size'], 'M');
      expect(variation.attributeValues['Color'], 'Red');
    });


    test('toJson converts ProductVariationModel instance to JSON', () {
      final variation = ProductVariationModel(
        id: 'variation_id',
        sku: 'ABC123-01',
        image: 'variation_image.jpg',
        description: 'Test variation',
        price: 99.99,
        salePrice: 79.99,
        stock: 5,
        attributeValues: {
          'Size': 'M',
          'Color': 'Red',
        },
      );

      final json = variation.toJson();

      expect(json['Id'], 'variation_id');
      expect(json['SKU'], 'ABC123-01');
      expect(json['Image'], 'variation_image.jpg');
      expect(json['Description'], 'Test variation');
      expect(json['Price'], 99.99);
      expect(json['SalePrice'], 79.99);
      expect(json['Stock'], 5);
      expect(json['AttributeValues'], {
        'Size': 'M',
        'Color': 'Red',
      });
    });
  });
}
