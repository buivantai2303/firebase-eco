import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer ({
    super.key,
    this.itemCount = 4,
});

  final int itemCount;

  @override
  Widget build (BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      height: 120,
      child: ListView.separated(
          itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems / 2,),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2,),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2,),
                TShimmerEffect(width: 80, height: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}