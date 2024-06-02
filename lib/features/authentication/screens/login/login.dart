import 'package:firebase_eco/common/styles/style.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/constants/text_strings.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 150,
                      image: AssetImage(TImages.darkAppLogo),
                    ),
                    Text(
                      TTexts.loginTitle,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(TTexts.loginSubTitle, style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium),
                  ],
                ),


                Form(child: Column(
                  children: [

                    ///Email
                    TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TTexts.email)
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Password
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const SizedBox (height: TSizes.spaceBtwInputFields / 2),

                    /// Remember Me & Forget Password
                    Row(
                      children: [

                        /// Remember Me
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text (TTexts.rememberMe),
                          ],
                        ),
                        TextButton(onPressed: () {}, child: const Text (TTexts.forgetPassword)),
                      ],
                    ),
                    const SizedBox (height: TSizes.spaceBtwSections),
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text (TTexts.signIn))),
                    const SizedBox (height: TSizes.spaceBtwItems),
                    /// Create Account Button
                    SizedBox(width: double.infinity, child: OutlinedButton (onPressed: () {}, child: const Text (TTexts.createAccount))), const SizedBox (height: TSizes.spaceBtwSections),
                  ],
                ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible (
                        child: Divider (color: dark? TColors.darkGrey: TColors.grey, thickness: 0.5, indent: 68, endIndent: 5)),

                    Text(
                      TTexts.orSignInWith.capitalize!,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Flexible(
// Fle
                        child: Divider (color: dark? TColors.darkGrey: TColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                  ],
                ),

                //footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration (border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)), child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.google),
                      ),
                    ),

                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
  }
