

import 'dart:convert';

import 'package:firebase_eco/data/repositories/product/product_repository.dart';
import 'package:firebase_eco/features/shop/models/product_model.dart';
import 'package:firebase_eco/utils/local_storage/storage_utility.dart';
import 'package:firebase_eco/utils/popups/loaders.dart';
import 'package:get/get.dart';

class  FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();


  final favourites = <String, bool>{}.obs;

  @override
   void onInit(){
    super.onInit();
    initFavourites();
  }


  Future<void> initFavourites() async{
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null ){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));

    }
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }



  void toggleFavouriteProduct(String productId){
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist');
    }else{
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product has been removed from the Wishlist');
    }
  }


  void  saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }


  Future<List<ProductModel>> favouriteProduct() async{
    return await ProductRepository.instance.getFavouriteProduct(favourites.keys.toList());
  }












}