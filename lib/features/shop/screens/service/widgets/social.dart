import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';

class Social extends StatelessWidget {
  const Social({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TCircularImage(image: TImages.facebook, width: 60, height: 60),
          TCircularImage(image: TImages.instagram, width: 60, height: 60),
          TCircularImage(image: TImages.shopee, width: 60, height: 60),
          TCircularImage(image: TImages.tiktok, width: 60, height: 60),
          TCircularImage(image: TImages.lazada, width: 60, height: 60),
        ],
      ),
    );
  }
}
