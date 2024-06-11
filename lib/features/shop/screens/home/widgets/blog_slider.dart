import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/blog_show_case.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_cart_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';



class TBlogSlider extends StatelessWidget {
  const TBlogSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  TSectionHeading(
                    // showActionButton: false,
                    title: 'Blog',
                    onPressed: () {},
                  ),
                  // -- Brand
                  const TBlogShowcase(
                    images: [
                      TImages.blog,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
