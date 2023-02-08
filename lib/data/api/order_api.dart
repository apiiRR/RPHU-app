import 'dart:convert';

import 'package:dio/dio.dart';

import 'string.dart';

class OrderAPI {
  static Future<Map<String, dynamic>> getAllOrder() async {
    try {
      Response response = await Dio().post("$host/api/v1/test/rphu-get/",
          data: jsonEncode({}), options: Options(headers: headers));
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> addOrder(Map<String, List> data) async {
    try {
      Response response = await Dio().post("$host/api/v1/test/rphu",
          data: jsonEncode(data), options: Options(headers: headers));
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> deleteOrder(int id) async {
    try {
      Response response = await Dio().post("$host/api/v1/test/rphu-delete/$id",
          data: jsonEncode({}), options: Options(headers: headers));
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }
}
