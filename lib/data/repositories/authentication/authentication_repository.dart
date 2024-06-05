import 'package:firebase_eco/features/authentication/screens/login/login.dart';
import 'package:firebase_eco/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenDirect();
  }

  /// Function to show Relevant Screen
  screenDirect() async {
    // Local Storage

    if (kDebugMode) {
      print('======================== Get Storage ========================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

/*---------------------------- Email & Password Sign In ----------------------------*/

  /// [Email Authentication] - Sign In

  /// [Email Authentication] - Register

  /// [ReAuthenticate] - ReAuthenticate User

  /// [Email Verification] - Mail Verification

  /// [Email Authentication] - Forget Password

/*---------------------------- Federated Identity & Social Sign In ----------------------------*/

  /// [Google Authentication] - Google

  /// [Facebook Authentication] - Facebook

/*---------------------------- Email & Password Sign In ----------------------------*/

  /// [Logout User] - Valid for any Authentication

  /// [Delete User] - Remove User
}
