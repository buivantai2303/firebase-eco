import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/appbar/tabbar.dart';
import 'package:firebase_eco/common/widgets/custom_shape/container/search_container.dart';
import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:firebase_eco/features/shop/screens/brand/all_brands.dart';
import 'package:firebase_eco/features/shop/screens/store/widgets/category_tab.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                          /// ---Search bar
                          const SizedBox(height: TSizes.spaceBtwItems),
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
                            onPressed: () => Get.to(() =>const AllBrandScreen()),),

                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          /// -- Brand GRID
                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(
                                  showBorder: true,
                                );
                              })
                        ],
                      ),
                    ),

                    /// -- Tabs
                    bottom: const TTabBar(
                      tabs: [
                        Tab(
                          child: Text('Sport'),
                        ),
                        Tab(
                          child: Text('Furniture'),
                        ),
                        Tab(
                          child: Text('Electronics'),
                        ),
                        Tab(
                          child: Text('Clothes'),
                        ),
                        Tab(
                          child: Text('Cosmetics'),
                        ),
                      ],
                    ),
                  )
                ];
              },

              /// -- Body
              body: const TabBarView(
                children: [
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                ],
              ))),
    );
  }
}
