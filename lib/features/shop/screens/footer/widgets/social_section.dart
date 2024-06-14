import 'package:flutter/material.dart';
import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kết nối với chúng tôi',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TCircularImage(image: TImages.facebook, width: 40, height: 40),
            SizedBox(width: 10),
            TCircularImage(image: TImages.instagram, width: 40, height: 40),
            SizedBox(width: 10),
            TCircularImage(image: TImages.tiktok, width: 40, height: 40),
          ],
        ),
      ],
    );
  }
}
