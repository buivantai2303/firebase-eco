import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Contact extends StatelessWidget {
  const Contact({
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
      child: const Column(
        children: [
          Text('Liên hệ với chúng tôi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.call, size: 30),
              SizedBox(width: 10),
              Text('094 749 2020', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.message, size: 30),
              SizedBox(width: 10),
              Text('cskh@astromazing.vn', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
