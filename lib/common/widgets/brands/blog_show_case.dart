import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../features/shop/controllers/brand_controller.dart';
import 'blog_cart.dart';

class TBlogShowcase extends StatelessWidget {
  const TBlogShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());

    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.grey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with products count
          TBlogCard(
            showBorder: false,
            brandImage: brandController.featuredBrands[0].image,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Brand top 3 product Image
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 500,
      width: 400,
      // padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkerGrey
          : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  ); // Expanded
}
