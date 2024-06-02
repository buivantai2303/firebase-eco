import 'package:firebase_eco/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_eco/common/styles/spacing_styles.dart';
import 'package:firebase_eco/features/authentication/screens/login/widgets/login_form.dart';
import 'package:firebase_eco/features/authentication/screens/login/widgets/login_header.dart';
import 'package:firebase_eco/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';

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
              /// Logo, Title, Subtitle
              TLoginHeader(dark: dark),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(
                dark: dark,
                dividerText: TTexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
