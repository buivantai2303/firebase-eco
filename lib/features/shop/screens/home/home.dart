import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// -- Home Appbar
                THomeAppbar()

                /// -- Search Bar
                /// -- Categories
              ],
            )),
          ],
        ),
      ),
    );
  }
}
