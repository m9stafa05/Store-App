import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
   Future<dynamic> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> jsonData = await Api().post(
      url: baseUrl,
      data: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromJson(jsonData);
  }
}