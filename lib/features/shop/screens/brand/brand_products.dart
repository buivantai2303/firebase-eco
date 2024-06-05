import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/brands/brand_card.dart';
import 'package:firebase_eco/common/widgets/products/sortable/sortable_product.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
