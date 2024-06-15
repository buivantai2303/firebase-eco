import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  testWidgets('Firebase initialization test', (WidgetTester tester) async {
    // Đảm bảo rằng Flutter đã được khởi tạo
    WidgetsFlutterBinding.ensureInitialized();

    try {
      // Khởi tạo Firebase
      await Firebase.initializeApp();
    } catch (e) {
      // In ra lỗi nếu khởi tạo Firebase thất bại
      print('Error initializing Firebase: $e');
    }

    // Kiểm tra xem Firebase đã được khởi tạo thành công hay không
    expect(Firebase.apps.length, greaterThan(0));
  });
}
