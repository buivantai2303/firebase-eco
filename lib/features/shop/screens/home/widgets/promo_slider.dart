import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_eco/features/shop/controllers/banner_controller.dart';
import 'package:firebase_eco/features/shop/controllers/home_controller.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/container/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        (){

          if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

          if (controller.banners.isEmpty){
            return const Center(child: Text('No Data Found'));
          }else{
            return Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index)),
                    items: controller.banners
                        .map(
                            (banners) => TRoundedImage(
                          imageUrl: banners.imageUrl,
                          isNetworkImage: true,
                          // onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                        .toList()),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carousalCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                        ),
                    ],
                  ),
                )
              ],
            );
          }


        }
    );
  }
}
