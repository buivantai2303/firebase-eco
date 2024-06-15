import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class TListTitleShimmer extends StatelessWidget {
  const TListTitleShimmer({
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2,),
                TShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}