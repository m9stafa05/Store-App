import 'package:flutter/cupertino.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<dynamic> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required int id,
    required String category,
  }) async {
    debugPrint('\n id: $id');
    // ignore: missing_required_param
    Map<String, dynamic> jsonData = await Api().put(
      url: '$baseUrl/$id',
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