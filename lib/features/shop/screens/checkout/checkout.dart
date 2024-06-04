import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget{
  const CheckoutScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: TCartItems(),
      
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256.0'),),
      ),
    )
  }
}