import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/appbar/tabbar.dart';
import 'package:firebase_eco/common/widgets/custom_shape/container/search_container.dart';
import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:firebase_eco/features/shop/controllers/brand_controller.dart';
import 'package:firebase_eco/features/shop/controllers/category_controller.dart';
import 'package:firebase_eco/features/shop/screens/brand/all_brands.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/features/shop/screens/store/widgets/category_tab.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../brand/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    print("itemCountP: ${brandController.featuredBrands.length}");

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
          appBar: TAppbar(
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              TCartCounterIcon(
                onPressed: () {},
              ),
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: TSizes.spaceBtwItems),

                          /// -- Search Bar
                          const TSearchContainer(
                            icon: Iconsax.search_normal,
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),

                          /// --- Feature Brands
                          TSectionHeading(
                            title: 'Featured Brands',
                            showActionButton: true,
                            onPressed: () =>
                                Get.to(() => const AllBrandScreen()),
                          ),

                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          /// -- Brand GRID
                          Obx(
                            () {
                              if (brandController.featuredBrands.isEmpty) {
                                const TBrandsShimmer();

                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                );

                                return Center(
                                  child: Text(
                                    "No Data Found!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white),
                                  ),
                                );
                              }

                              return TGridLayout(
                                itemCount:
                                    brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return TBrandCard(
                                    showBorder: true,
                                    brand: brand,
                                    onTap: () => Get.to(
                                        () => BrandProducts(brand: brand)),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    /// -- Tabs
                    bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList(),
                    ),
                  )
                ];
              },

              /// -- Body
              body: TabBarView(
                children: categories
                    .map((category) => TCategoryTab(category: category))
                    .toList(),
              ))),
    );
  }
}

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
    ); // TGridLayout
  }
}
