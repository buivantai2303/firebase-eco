import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/icons/t_circular_icon.dart';
import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/loaders/animation_loader.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:firebase_eco/features/shop/controllers/product/favourites_controller.dart';
import 'package:firebase_eco/features/shop/screens/home/home.dart';
import 'package:firebase_eco/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProduct(),
                    builder: (context, snapshot) {
                      final emptyWidget = TAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty! ',
                        animation: TImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add something',
                        onActionPressed: () => Get.to(const HomeScreen()),
                      );

                      const loader = TVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(product: products[index]));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
