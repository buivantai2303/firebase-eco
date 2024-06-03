import 'package:firebase_eco/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:firebase_eco/utils/constants/colors.dart';
import 'package:firebase_eco/utils/constants/sizes.dart';
import 'package:firebase_eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget{
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
      ? TColors.darkGrey
        : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
    child: Stack(
      children: [
        Positioned(
          right: 5,
          top: 0,
          child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
          color: selectedAddress
            ? dark
            ? TColors.light
            : TColors.dark : null),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: TSizes.sm / 2),
            const Text('(+123) 456 789', maxLines: 1, overflow: TextOverflow.ellipsis,),
            const SizedBox(height: TSizes.sm / 2),
            const Text('82356 Tinny Coves, South Liana, Maine, 87665, USA', softWrap: true,),
          ],
        )
      ],
    ),
    );
  }
}