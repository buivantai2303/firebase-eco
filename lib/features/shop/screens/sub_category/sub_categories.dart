import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:firebase_eco/common/widgets/images/t_rounded_image.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:firebase_eco/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/controllers/category_controller.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/features/shop/screens/all_products/all_products.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text(category.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TRoundedImage(imageUrl: TImages.promoBanner1, applyImageRadius: true, width: double.infinity),
              SizedBox(width: TSizes.spaceBtwSections,),

              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if(widget != null) return widget;

                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {

                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {

                            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                            if(widget != null) return widget;

                            final products = snapshot.data!;


                            return Column(
                              children: [
                                TSectionHeading(title: subCategory.name, onPressed: () => Get.to(() => AllProducts(title: subCategory.name, futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),))),
                                const SizedBox(height: TSizes.spaceBtwItems / 2,),
                            
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                      itemCount: products.length, scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                                      itemBuilder: (context, index) => TProductCardHorizontal(product: products[index])),
                                ),
                              ],
                            );
                          }
                        );
                      },
                    );



                }
              )
            ],
          ),
        ),
      ),
    );
  }
}