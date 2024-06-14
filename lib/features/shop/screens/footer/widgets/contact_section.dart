import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liên hệ với chúng tôi',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Iconsax.call, size: 20, color: Colors.white),
            SizedBox(width: 10),
            Text(
              '094 749 2020',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Iconsax.message, size: 20, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'cskh@astromazing.vn',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
