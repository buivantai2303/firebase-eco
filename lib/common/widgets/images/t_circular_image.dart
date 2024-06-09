import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_eco/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 50,
    this.height = 56,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If image background color is null then switch it to Light and dark mode color design.
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      // BoxDecoration
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
            ?CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              progressIndicatorBuilder:(context,url,downloadProgress) => const TShimmerEffect(width: 55, height: 55,radius: 55,),
              errorWidget: (context,url,error) => const Icon(Icons.error),
              )
        
            :Image(
              fit: fit,
              image: AssetImage(image) as ImageProvider,
              color: overlayColor,
                  )
        
          ),
      )
    );
  }
}
