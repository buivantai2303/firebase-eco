import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppbar(title: Text ('Popular Products'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value){},
                items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity']
                .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              /// Product
              TGridLayout(itemCount: 10, itemBuilder: (_,index) => const TProductCardVertical())

            ],
          ),
        ),



      ),
    );
  }
}
