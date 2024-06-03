import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppbar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
