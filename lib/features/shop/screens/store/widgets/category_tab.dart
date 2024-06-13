import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/data/repositories/product/product_repository.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../models/product_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;
  // final ProductRepository.in

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  // -- Brand
                  const TBrandShowcase(
                    images: [
                      TImages.productImage1,
                      TImages.productImage2,
                      TImages.productImage3,
                    ],
                  ),
                  const TBrandShowcase(
                    images: [
                      TImages.productImage1,
                      TImages.productImage2,
                      TImages.productImage3,
                    ],
                  ),

                  /// -- Product
                  TSectionHeading(
                    title: 'You might like',
                    onPressed: () {},
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: ProductModel.empty(),
                    ),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
