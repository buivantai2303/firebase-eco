import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/brands/brand_card.dart';
import 'package:firebase_eco/common/widgets/products/sortable/sortable_product.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_cart_vertical.dart';
import '../../../../utils/constants/sizes.dart';



class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppbar(title: Text ('Brands'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
             TSectionHeading(title: 'Brands',showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              /// Brands
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>  TBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const BrandProducts()),
                  )
              ),

            ],
          ),
        ),



      ),
    );
  }
}
