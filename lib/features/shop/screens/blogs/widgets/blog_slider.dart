import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/blog_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';

class TBlogSlider extends StatelessWidget {
  const TBlogSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        TBlogShowcase(
          images: [
            TImages.blog,
          ],
        ),
      ],
    );
  }
}
