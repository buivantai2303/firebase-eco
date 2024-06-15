import 'package:firebase_eco/features/personalization/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

import 'mocks.mocks.dart'; // Import file mock được tạo

void main() {
  group('UserModel', () {
    test('fromSnapshot trả về UserModel đúng', () {
      // Sắp xếp
      final mockSnapshot = MockDocumentSnapshot<Map<String, dynamic>>(); // Chỉ định loại cụ thể
      when(mockSnapshot.id).thenReturn('userId');
      when(mockSnapshot.data()).thenReturn({
        'FirstName': 'John',
        'LastName': 'Doe',
        'Username': 'john_doe',
        'Email': 'john@example.com',
        'PhoneNumber': '1234567890',
        'ProfilePicture': 'http://example.com/profile.jpg',
      });

      // Hành động
      final user = UserModel.fromSnapshot(mockSnapshot);

      // Kiểm tra
      expect(user.id, 'userId');
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.username, 'john_doe');
      expect(user.email, 'john@example.com');
      expect(user.phoneNumber, '1234567890');
      expect(user.profilePicture, 'http://example.com/profile.jpg');
    });

    test('fromSnapshot trả về UserModel rỗng nếu data là null', () {
      // Sắp xếp
      final mockSnapshot = MockDocumentSnapshot<Map<String, dynamic>>(); // Chỉ định loại cụ thể
      when(mockSnapshot.data()).thenReturn(null);

      // Hành động
      final user = UserModel.fromSnapshot(mockSnapshot);

      // Kiểm tra
      expect(user.id, '');
      expect(user.firstName, '');
      expect(user.lastName, '');
      expect(user.username, '');
      expect(user.email, '');
      expect(user.phoneNumber, '');
      expect(user.profilePicture, '');
    });

    test('kiểm tra thuộc tính fullName trả về đúng', () {
      // Sắp xếp
      final user = UserModel(
        id: '123',
        firstName: 'Bui Van',
        lastName: 'Tai',
        username: 'buivantai2303',
        email: 'buivantai2303@gmail.com',
        phoneNumber: '0965422203',
        profilePicture: 'https://firebasestorage.googleapis.com/v0/b/feco-eaut.appspot.com/o/Users%2FImages%2FProfile%2Fscaled_1000000868.jpg?alt=media&token=367fe759-e819-4f36-88b0-edaa4b542b3e',
      );

      // Kiểm tra
      expect(user.fullName, 'Bui Van Tai');
    });

    test('kiểm tra phương thức formattedPhoneNo trả về đúng định dạng', () {
      // Sắp xếp
      final user = UserModel(
        id: '123',
        firstName: 'Bui Van',
        lastName: 'Tai',
        username: 'buivantai2303',
        email: 'buivantai2303@gmail.com',
        phoneNumber: '0965422203',
        profilePicture: 'https://firebasestorage.googleapis.com/v0/b/feco-eaut.appspot.com/o/Users%2FImages%2FProfile%2Fscaled_1000000868.jpg?alt=media&token=367fe759-e819-4f36-88b0-edaa4b542b3e',
      );

      // Hành động và kiểm tra
      expect(user.formattedPhoneNo, '+84 965 422 203');
    });

    test('kiểm tra phương thức generateUsername trả về username đúng', () {
      // Sắp xếp
      final fullName = 'Bui Van Tai';

      // Hành động
      final username = UserModel.generateUsername(fullName);

      // Kiểm tra
      expect(username, 'cwt_buivantai');
    });

    test('kiểm tra phương thức toJson trả về JSON đúng', () {
      // Sắp xếp
      final user = UserModel(
        id: '123',
        firstName: 'Bui Van',
        lastName: 'Tai',
        username: 'buivantai2303',
        email: 'buivantai2303@gmail.com',
        phoneNumber: '0965422203',
        profilePicture: 'https://firebasestorage.googleapis.com/v0/b/feco-eaut.appspot.com/o/Users%2FImages%2FProfile%2Fscaled_1000000868.jpg?alt=media&token=367fe759-e819-4f36-88b0-edaa4b542b3e',
      );

      // Hành động
      final json = user.toJson();

      // Kiểm tra
      expect(json, {
        'FirstName': 'Bui Van',
        'LastName': 'Tai',
        'Username': 'buivantai2303',
        'Email': 'buivantai2303@gmail.com',
        'PhoneNumber': '0965422203',
        'ProfilePicture': 'https://firebasestorage.googleapis.com/v0/b/feco-eaut.appspot.com/o/Users%2FImages%2FProfile%2Fscaled_1000000868.jpg?alt=media&token=367fe759-e819-4f36-88b0-edaa4b542b3e',
      });
    });

    test('kiểm tra phương thức nameParts trả về đúng mảng các phần của tên', () {
      // Sắp xếp
      final fullName = 'Bui Van Tai';

      // Hành động
      final parts = UserModel.nameParts(fullName);

      // Kiểm tra
      expect(parts, ['Bui', 'Van', 'Tai']);
    });
  });
}
