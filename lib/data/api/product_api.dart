import 'dart:convert';

import 'package:dio/dio.dart';

import 'string.dart';

class ProductAPI {
  static Future<Map<String, dynamic>> getAllProduct() async {
    try {
      Response response = await Dio().post("$host/api/v1/test/product-get",
          data: jsonEncode({}), options: Options(headers: headers));
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }
}
