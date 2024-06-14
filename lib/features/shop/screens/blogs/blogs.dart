import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/blog_slider.dart';

class Blogs extends StatelessWidget {
  const Blogs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 4,
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(title: 'Blogs'),
              Column(
                children: [
                  SizedBox(
                    height: 750,
                    child: TabBarView(
                      children: [
                        TBlogSlider(),
                        TBlogSlider(),
                        TBlogSlider(),
                        TBlogSlider(),
                      ],
                    ),
                  ),
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                      Tab(icon: Icon(Iconsax.cd)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
