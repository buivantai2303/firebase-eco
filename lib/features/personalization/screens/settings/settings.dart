import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/list_title/settings_menu_title.dart';
import 'package:firebase_eco/common/widgets/texts/action_heading.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/personalization/screens/address/address.dart';
import 'package:firebase_eco/features/personalization/screens/profile/profile.dart';
import 'package:firebase_eco/features/shop/screens/order/order.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/list_title/user_profile_title.dart';
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
                /// Appbar
                TAppbar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),

                ///  List Title
                TUserProfileTitle(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),

          /// Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Account Settings
                const TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TSettingsMenuTitle(
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subTitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                const TSettingsMenuTitle(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout'),
                TSettingsMenuTitle(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen())
                    ),

                const TSettingsMenuTitle(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account'),
                const TSettingsMenuTitle(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons'),
                const TSettingsMenuTitle(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message'),
                const TSettingsMenuTitle(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts'),

                /// -- App Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TActionHeading(
                    title: 'App Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSettingsMenuTitle(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase'),
                TSettingsMenuTitle(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subTitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),

                /// -- Logout Button
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Logout')),
                ), // SizedBox
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ),
          )
        ],
      )),
    );
  }
}
