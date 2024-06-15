import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/images/t_rounded_image.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(title: Text("Sports shirts"), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(imageUrl: TImages.promoBanner1, applyImageRadius: true, width: double.infinity),
              const SizedBox(width: TSizes.spaceBtwSections,),

              Column(
                children: [
                  TSectionHeading(title: 'Sport shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4, scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder: (context, index) => const TProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}