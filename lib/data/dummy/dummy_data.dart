import 'package:firebase_eco/features/shop/models/category_model.dart';
import 'package:firebase_eco/utils/constants/image_strings.dart';

class TDummyData {
  // static final UserModel user = UserModel(id: id, firstName: firstName, lastName: lastName, username: username, email: email, phoneNumber: phoneNumber, profilePicture: profilePicture);
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Laptops', image: TImages.acerlogo, isFeatured: true),
  ];
}
