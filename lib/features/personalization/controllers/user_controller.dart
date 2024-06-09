import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_eco/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_eco/data/repositories/user/user_repository.dart';
import 'package:firebase_eco/features/authentication/screens/login/login.dart';
import 'package:firebase_eco/features/personalization/models/user_model.dart';
import 'package:firebase_eco/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/network_manager.dart';
import 'package:firebase_eco/utils/popups/full_screen_loader.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value =false;
    }
  }

/// Save user Record from any Registration provider
Future<void> saveUserRecord (UserCredential? userCredentials) async {
  try {
      if (userCredentials != null) {
  // Convert Name to First and Last Name
      final nameParts = UserModel.nameParts (userCredentials.user!.displayName ?? '');
      final username = UserModel.generateUsername (userCredentials.user!.displayName ?? '');

      // Map Data
      final user = UserModel(
      id: userCredentials.user!.uid,
      firstName: nameParts[0],
      lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
      username: username,
      email: userCredentials.user!.email ??'',
      phoneNumber: userCredentials.user!.phoneNumber ??'',
      profilePicture: userCredentials.user!.photoURL ??'',
      );

      // Save user data
      await userRepository.saveUserRecord(user);
      }
  } catch (e) {
    TLoaders.warningSnackBar(
      title: 'Data not saved',
      message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
    );
  }
}

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
      'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
         
        ),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete'),),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), // Close the dialog
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      // Re-verify Auth Email
      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        TFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Re-authenticate with email and password
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );

      // Delete the user account
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}