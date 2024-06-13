import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/screens/all_products/all_products.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/blog_slider.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_categories.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shape/container/search_container.dart';
import '../../../../common/widgets/texts/action_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';
import '../service/service_contact_information.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  ///

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    print("ProductCount: ${controller.featuredProducts.length}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Search Container
                  TSearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Popular Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Heading
                        TActionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: 'Popular Product',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            /// Blog
            const DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 750, // Adjust the height as needed
                    child: TabBarView(
                      children: [
                        TBlogSlider(),
                        TBlogSlider(),
                        TBlogSlider(),
                        TBlogSlider(),
                      ],
                    ),
                  ),
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                    ],
                  ),
                ],
              ),
            ),

            // Services and Contact Information
            const ServiceAndContactInformation(),
          ],
        ),
      ),
    );
  }
}
