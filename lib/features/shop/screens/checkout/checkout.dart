import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:firebase_eco/common/widgets/success_screen/success_screen.dart';
import 'package:firebase_eco/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:firebase_eco/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:firebase_eco/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:firebase_eco/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:firebase_eco/navigation_menu.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      /// -- AppBar
      appBar: TAppbar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            /// Items in Cart
            children: [
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Coupon TextField
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Payment Method
                    TBillingPaymentSection(),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
