import 'package:firebase_eco/features/personalization/models/user_model.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../features/shop/models/banner_model.dart';
import '../../routes/routes.dart';

class TDummyData {
  // static final UserModel user = UserModel(id: id, firstName: firstName, lastName: lastName, username: username, email: email, phoneNumber: phoneNumber, profilePicture: profilePicture);
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Laptops', image: TImages.acerlogo, isFeatured: true),
  ];

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];
}
