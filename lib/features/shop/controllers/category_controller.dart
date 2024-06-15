import 'package:firebase_eco/data/repositories/categories/category_repository.dart';
import 'package:firebase_eco/data/repositories/product/product_repository.dart';
import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/features/shop/models/product_model.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    print("CateD: ${_categoryRepository.getAllCategories()}");
    try {
      // Show loader
      isLoading.value = true;

      // Fetch data from source (Firebase)
      final categories = await _categoryRepository.getAllCategories();

      // Update Category List
      allCategories.assignAll(categories);

      // Filter
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap! (Categories - 1)', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load Category Data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap! (Categories - 2)', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  /// Get Category or Sub-Category Products
// Future<List<ProductModel>> getCategoryProducts(
//     {required String categoryId, int limit = 4}) async {
//   try {
//     final products = await ProductRepository.instance
//         .getProductsForCategory(categoryId: categoryId, limit: limit);
//     return products;
//   } catch (e) {
//     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     return [];
//   }
// }
}
