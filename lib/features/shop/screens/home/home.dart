import 'package:firebase_eco/common/widgets/images/t_circular_image.dart';
import 'package:firebase_eco/common/widgets/layouts/grid_layout.dart';
import 'package:firebase_eco/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:firebase_eco/common/widgets/texts/section_heading.dart';
import 'package:firebase_eco/features/shop/screens/all_products/all_products.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/blog_slider.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/home_categories.dart';
import 'package:firebase_eco/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shape/container/search_container.dart';
import '../../../../common/widgets/texts/action_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../store/widgets/category_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Search Container
                  TSearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Popular Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Heading
                        TActionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TSectionHeading(
                      title: 'Popular Product',
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => const TProductCardVertical()),

                    const SizedBox(height: TSizes.spaceBtwSections),
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [

                          SizedBox(
                            height: 700, // Adjust the height as needed
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
                              Tab(icon: Icon(Iconsax.arrow_up)),
                              Tab(icon: Icon(Iconsax.arrow_up)),
                              Tab(icon: Icon(Iconsax.arrow_up)),
                              Tab(icon: Icon(Iconsax.arrow_up)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),


// Services and Contact Information
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(Iconsax.back_square, size: 40),
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
                                Text('HỖ TRỢ TẬN TÌNH'),
                                Text('Thông báo tình trạng đơn hàng 24/7'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TCircularImage(image: TImages.facebook, width: 60, height: 60),
                        TCircularImage(image: TImages.instagram, width: 60, height: 60),
                        TCircularImage(image: TImages.shopee, width: 60, height: 60),
                        TCircularImage(image: TImages.tiktok, width: 60, height: 60),
                        TCircularImage(image: TImages.lazada, width: 60, height: 60),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(20),
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
                        Text('Liên hệ với chúng tôi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  ),
                  const SizedBox(height: 20),
                  Container(
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
                            Text('THÔNG TIN:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                            Text('CHÍNH SÁCH:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}