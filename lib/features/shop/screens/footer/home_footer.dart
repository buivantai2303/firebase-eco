import 'package:firebase_eco/features/shop/screens/footer/widgets/contact_section.dart';
import 'package:firebase_eco/features/shop/screens/footer/widgets/policy_text.dart';
import 'package:firebase_eco/features/shop/screens/footer/widgets/section_heading.dart';
import 'package:firebase_eco/features/shop/screens/footer/widgets/social_section.dart';
import 'package:flutter/material.dart';

class THomeFooter extends StatelessWidget {
  const THomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(
                      title: 'THÔNG TIN',
                      textColor: Colors.white,
                    ),
                    PolicyText(
                        title: 'Về AstroMazing', textColor: Colors.white),
                    PolicyText(
                        title: 'Liên hệ hợp tác', textColor: Colors.white),
                    PolicyText(title: 'Sitemap', textColor: Colors.white),
                    PolicyText(title: 'Shopee', textColor: Colors.white),
                    PolicyText(title: 'Lazada', textColor: Colors.white),
                    PolicyText(title: 'Tiktok', textColor: Colors.white),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(
                      title: 'CHÍNH SÁCH',
                      textColor: Colors.white,
                    ),
                    PolicyText(
                        title: 'Tích điểm thành viên', textColor: Colors.white),
                    PolicyText(
                        title: 'Giao hàng & Thanh toán',
                        textColor: Colors.white),
                    PolicyText(
                        title: 'Chính sách bán sĩ & CTV',
                        textColor: Colors.white),
                    PolicyText(
                        title: 'Hướng dẫn sử dụng', textColor: Colors.white),
                    PolicyText(
                        title: 'Bảo hành & Đổi trả', textColor: Colors.white),
                    PolicyText(
                        title: 'Hợp tác KOL & KOC', textColor: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: ContactSection()),
              SizedBox(width: 20),
              Expanded(child: SocialSection()),
            ],
          ),
        ],
      ),
    );
  }
}
