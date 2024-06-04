import 'package:firebase_eco/common/widgets/chips/choice_chip.dart';
import 'package:firebase_eco/common/widgets/texts/product_price_text.dart';
import 'package:firebase_eco/common/widgets/texts/product_title_text.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price, and Stock Status
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Price', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Sale Price
                          const TProductPriceText(price: '28'),
                        ],
                      ),

                      /// Stock Status
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock:', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const TProductTitleText(
                title:
                    'This is the description of the product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Colors Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Size Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 40', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
