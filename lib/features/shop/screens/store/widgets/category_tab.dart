import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/product/product_controller.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

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

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final products = controller.featuredProducts;
                      final itemCount =
                          products.length < 4 ? products.length : 4;
                      return TGridLayout(
                        itemCount: itemCount,
                        itemBuilder: (_, index) =>
                            TProductCardVertical(product: products[index]),
                      );
                    }
                  }),

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
