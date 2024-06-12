import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/popups/loaders.dart';
import '../repositories/brand/brand_repository.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Laptops', image: TImages.appleLogo, isFeatured: true),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        name: 'Apple',
        image: TImages.appleLogo,
        isFeatured: true,
        productsCount: 6000),
  ];

  BrandRepository brandRepository = BrandRepository();

  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  TDummyData() {
    uploadDummyDataToFirebase();
  }

  void uploadDummyDataToFirebase() async {
    try {
      await brandRepository.uploadDummyData(brands);
      TLoaders.successSnackBar(
          title: 'Upload Successful', message: 'Data uploaded successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    }
  }
}
