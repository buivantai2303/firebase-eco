import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:firebase_eco/features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final networkImage = controller.user.value.profilePicture;
    final image = networkImage.isNotEmpty
        ? NetworkImage(networkImage)
        : const AssetImage(TImages.user);

    return ListTile(
        leading: CircleAvatar(
          backgroundImage: image is NetworkImage
              ? image
              : const AssetImage(TImages.user) as ImageProvider,
          radius: 25,
        ),

        // Title
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),

        // Subtitle
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),

        // Trailing
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          ),
        ));
  }
}
