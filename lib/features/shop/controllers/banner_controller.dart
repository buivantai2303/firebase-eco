import 'package:firebase_eco/data/repositories/banners/banner_reposity.dart';
import 'package:firebase_eco/features/shop/controllers/home_controller.dart';
import 'package:firebase_eco/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';


class BannerController extends GetxController{

  final isLoading = false.obs;

 final carousalCurrentIndex = 0.obs;

 final RxList<BannerModel> banners = <BannerModel>[].obs;


 @override
  void onInit(){
   fetchBanners();
   super.onInit();
  }


void updatePageIndicator(index){
  carousalCurrentIndex.value = index;
}

 Future<void> fetchBanners() async {
   try {
     // Show loader
     isLoading.value = true;

     // Fetch data from source (Firebase)

     final bannerRepo = Get.put(BannerReposity());
     final banners = await bannerRepo.fetchBanners();

     this.banners.assignAll(banners);

   } catch (e) {
     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   } finally {
     isLoading.value = false;
   }
 }

}