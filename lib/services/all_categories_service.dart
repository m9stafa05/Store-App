import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    // ignore: missing_required_param
    List<dynamic> jsonData = await Api().get(
      url: '$baseUrl/categories',
    );
    return jsonData;
  }
}
