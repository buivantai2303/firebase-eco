import 'package:flutter/material.dart';

class Policies extends StatelessWidget {
  const Policies({
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
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('THÔNG TIN:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Về AstroMazing', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Liên hệ hợp tác', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Sitemap', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Shopee', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Lazada', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Tiktok', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('CHÍNH SÁCH:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Tích điểm thành viên', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Giao hàng & Thanh toán', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Chính sách bán sĩ & CTV', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Hướng dẫn sử dụng', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Bảo hành & Đổi trả', style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text('Hợp tác KOL & KOC', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
