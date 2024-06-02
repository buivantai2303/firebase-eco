import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget{
  const SignupScreen({super.key})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
                children: [
                ],
                /// Title
                Text(TTexts.signupTitle, style: Theme. of (context).text Theme.headlineMedium), const SizedBox(height: TSizes.spaceBtwSections),
                /// Form
                Form(
                -child: Column(
                children: [
                ],
                Row(
                children: [
                1,
                TextFormField(
            expands: false,
            -decoration: const InputDecoration (labelText: TTexts.firstName, prefixIcon: Icon (Iconsax.user
            ), // TextFormField
          ) // Row
      ), // Column
    ), // Form
    ), // Column
    ), // Padding
    ), // SingleChildScrollView
    ),
    );
}