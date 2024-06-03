import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - product Image Slider
            TCurvedEdgeWidget(
              child: Container(
                color: dark ? TColors.darkerGrey : TColors.light,
                // Assuming dark is not defined, default to light color
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                        child: Center(
                          child: Image(
                            image: AssetImage(TImages.productImage5),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 30,
                      left: TSizes.defaultSpace,
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (_, index) => TRoundedImage(
                            width: 80,
                            backgroundColor:
                                dark ? TColors.darkerGrey : TColors.light,
                            // Assuming dark is not defined, default to white color
                            border: Border.all(color: TColors.primary),
                            padding: const EdgeInsets.all(TSizes.sm),
                            imageUrl: TImages.productImage3,
                          ),
                        ),
                      ),
                    ),
                    const TAppbar(
                      showBackArrow: true,
                      actions: [
                        TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// 2 - product detail
            const Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  TRatingAndShare(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
