import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
