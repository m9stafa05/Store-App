import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        "The request failed with status: ${response.statusCode}",
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await Dio().post(
      url,
      data: data,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        "The request failed with status: ${response.statusCode} with body ${response.data}",
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic data,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await Dio().post(
      url,
      data: data,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        "The request failed with status: ${response.statusCode} with body ${response.data}",
      );
    }
  }
}
