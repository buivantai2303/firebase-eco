import 'package:firebase_eco/features/shop/screens/service/widgets/terms_context.dart';
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
        ],
      ),
    );
  }
}
