import 'package:firebase_eco/data/repositories/brand/brand_repository.dart';
import 'package:firebase_eco/data/repositories/product/product_repository.dart';
import 'package:firebase_eco/features/shop/models/brand_model.dart';
import 'package:firebase_eco/features/shop/models/product_model.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  RxBool isLoading = true.obs;
  final brandRepository = Get.put(BrandRepository());
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getAllBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.fetchAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured == true).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap! (Brand - Get Feature)", message: e.toString());
    } finally {
      isLoading.value = true;
    }
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.fetchFeaturedBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured == true).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap! (Brand - Get Feature)", message: e.toString());
    } finally {
      isLoading.value = true;
    }
  }

  /// Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap! (Brand - Products)', message: e.toString());
      return [];
    }
  }
}
