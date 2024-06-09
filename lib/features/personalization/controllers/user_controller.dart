import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_eco/data/repositories/user/user_repository.dart';
import 'package:firebase_eco/features/personalization/models/user_model.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final imageUploading = false.obs;
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
      await fetchUserRecord();

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

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('/Users/Images/Profile/',image);

        // Update User's Field
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oops!', message: 'Something went wrong: $e');
    }finally{
      imageUploading.value = false;
    }
  }
}