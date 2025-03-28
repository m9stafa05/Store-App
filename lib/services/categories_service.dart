import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts({
    required String categoryName,
  }) async {
    List<dynamic> jsonData = await Api().get(
      url: "$baseUrl/category/$categoryName",
    );
    List<ProductModel> categoryproducts = [];
    for (int i = 0; i < jsonData.length; i++) {
      categoryproducts.add(ProductModel.fromJson(jsonData[i]));
    }
    return categoryproducts;
  }
}
