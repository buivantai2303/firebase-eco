import 'package:firebase_eco/features/shop/screens/service/widgets/policies.dart';
import 'package:firebase_eco/features/shop/screens/service/widgets/social.dart';
import 'package:firebase_eco/features/shop/screens/service/widgets/contact.dart';
import 'package:firebase_eco/features/shop/screens/service/widgets/terms.dart';
import 'package:flutter/material.dart';

class ServiceAndContactInformation extends StatelessWidget {
  const ServiceAndContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          /// Terms
          Terms(),
          SizedBox(height: 20),

          /// Social Information
          Social(),
          SizedBox(height: 20),

          /// Terms and Policies
          Contact(),
          SizedBox(height: 20),

          /// Policies
          Policies(),
        ],
      ),
    );
  }
}
