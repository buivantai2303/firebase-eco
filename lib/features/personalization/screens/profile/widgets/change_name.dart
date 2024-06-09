import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/data/repositories/user/user_repository.dart';
import 'package:firebase_eco/features/personalization/controllers/user_controller.dart';
import 'package:firebase_eco/features/personalization/screens/profile/profile.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/constants/text_strings.dart';
import 'package:firebase_eco/utils/helpers/network_manager.dart';
import 'package:firebase_eco/utils/popups/full_screen_loader.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:firebase_eco/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart'; // Thêm thư viện icons nếu cần

// Giả sử bạn có các thư viện hỗ trợ như TSizes, TTexts, TValidator, và TAppBar

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    // Đặt controller cho việc cập nhật tên
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      // Custom AppBar
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ), // TAppBar
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ), // Text
            const SizedBox(height: TSizes.spaceBtwSections),

            // Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ), // TextFormField
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ), // TextFormField
                  ),
                ],
              ), // Column, Form
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Save'),
              ),
            ), // SizedBox
          ],
        ),
      ),
    );
  }
}

// Controller cho việc cập nhật tên
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...',
          TImages.docerAnimation
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
// Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loading
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your name has been updated.'
      );

      // Move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Erro", message: e.toString());
    } finally {

    }
  }
}