import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_eco/features/shop/models/product_attribute_model.dart';
import '../mocks.mocks.dart'; // Import your generated mocks

void main() {
  group('ProductAttributeModel Tests', () {
    test('fromJson returns correct model with complete data', () {
      final mockData = {
        'Name': 'Color',
        'Values': ['Red', 'Blue', 'Green'],
      };

      final attribute = ProductAttributeModel.fromJson(mockData);

      expect(attribute.name, 'Color');
      expect(attribute.values, ['Red', 'Blue', 'Green']);
    });


    test('toJson returns correct JSON format', () {
      final attribute = ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']);

      final json = attribute.toJson();

      expect(json['Name'], 'Size');
      expect(json['Values'], ['S', 'M', 'L']);
    });


    test('toJson returns correct JSON format with empty values list', () {
      final attribute = ProductAttributeModel(name: 'Size', values: []);

      final json = attribute.toJson();

      expect(json['Name'], 'Size');
      expect(json['Values'], isEmpty);
    });

    
    test('toJson returns correct JSON format with null values', () {
      final attribute = ProductAttributeModel(name: 'Size');

      final json = attribute.toJson();

      expect(json['Name'], 'Size');
      expect(json['Values'], isNull);
    });


    test('toJson returns correct JSON format with non-empty values list', () {
      final attribute = ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']);

      final json = attribute.toJson();

      expect(json['Name'], 'Size');
      expect(json['Values'], ['S', 'M', 'L']);
    });

  });
}
