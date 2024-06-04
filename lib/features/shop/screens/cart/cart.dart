import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/images/t_rounded_image.dart';
import 'package:firebase_eco/common/widgets/texts/product_title_text.dart';
import 'package:firebase_eco/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) => Column(
                  children: [
                    Row(
                      children: [
                        /// Image
                        TRoundedImage(
                          imageUrl: TImages.productImage1,
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(TSizes.sm),
                          backgroundColor: THelperFunctions.isDarkMode(context)
                              ? TColors.darkerGrey
                              : TColors.light,
                        ),

                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),

                        /// Title, Size, Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TBrandTitleWithVerifiedIcon(title: 'Nike'),
                            const TProductTitleText(
                              title: 'Black Sport Shoes',
                              maxLines: 1,
                            ),

                            /// Attributes
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Color ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: 'Green ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(
                                  text: 'Size ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(
                                  text: 'UK 08 ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ]))
                          ],
                        )
                      ],
                    )
                  ],
                ),
            separatorBuilder: (_, __) => const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
            itemCount: 4),
      ),
    );
  }
}
