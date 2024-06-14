import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class Terms extends StatelessWidget {
  const Terms({
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
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Iconsax.back_square, size: 40),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text('HOÀN TRẢ MIỄN PHÍ'),
                  Text('Trả hàng miễn phí trong 7 ngày'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Iconsax.shield_tick, size: 40),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text('CAM KẾT CHÍNH HÃNG'),
                  Text('Hoàn tiền gấp đôi nếu phát hiện hàng giả'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Iconsax.truck, size: 40),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text('MIỄN PHÍ VẬN CHUYỂN'),
                  Text('Giao hàng miễn phí trên toàn quốc'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Iconsax.support, size: 40),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text('HỖ TRỢ TẬN TÌNH'),
                  Text('Thông báo tình trạng đơn hàng 24/7'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
