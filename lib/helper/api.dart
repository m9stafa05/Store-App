import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get({required String url}) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        "The request failed with status: ${response.statusCode}",
      );
    }
  }
}
