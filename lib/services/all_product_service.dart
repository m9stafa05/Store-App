import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    // ignore: missing_required_param
    List<dynamic> jsonData = await Api().get(url: baseUrl);
    List<ProductModel> products = [];
    for (int i = 0; i < jsonData.length; i++) {
      products.add(ProductModel.fromJson(jsonData[i]));
    }
    return products;
  }
}
