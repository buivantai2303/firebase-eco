import 'package:firebase_eco/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../../../utils/constants/colors.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(() => TCircularIcon(
          icon: controller.isFavourite(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourite(productId) ? TColors.error : null,
          onPressed: () => controller.toggleFavouriteProduct(productId),
        ));
  }
}
