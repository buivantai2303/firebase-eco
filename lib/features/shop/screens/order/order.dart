import 'package:firebase_eco/common/widgets/appbar/appbar.dart';
import 'package:firebase_eco/features/shop/screens/order/widgets/orders_list.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TOrderListItem()),
    );
  }
}
