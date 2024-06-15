import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/controllers/category_controller.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/features/shop/models/product_model.dart';
import 'package:firebase_eco/features/shop/screens/all_products/all_products.dart';
import 'package:firebase_eco/features/shop/screens/store/widgets/category_brands.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/cloud_helper_functions.dart';
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
    final controller = CategoryController.instance;

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
                  CategoryBrands(category: category),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  FutureBuilder(
                      future: controller.getCategoryProducts(categoryId: category.id),
                      builder: (context, snapshot) {

                        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const TVerticalProductShimmer());
                        if(response != null) return response;

                        final products = snapshot.data;

                        return Column(
                        children: [
                          TSectionHeading(title: 'title', onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            fut
                          )),),
                          const SizedBox(height: TSizes.spaceBtwItems,),
                          TGridLayout(itemCount: products!.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index]))
                        ],
                        );
                    },
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
