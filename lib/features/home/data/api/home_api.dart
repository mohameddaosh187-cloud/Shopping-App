import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/api_constants.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/utils/app_flutter_secure_storage.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/model/products_list_model.dart';

abstract class HomeApi {
  static Future<ApiResult<CategoriesListDto>> getAllCategories() async {
    try {
      Uri url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.categories}");
      final token = await AppFlutterSecureStorage.getData("Token");

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(CategoriesListDto.fromJson(json));
      } else {
        return Error(json["message"]);
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }

  static Future<ApiResult<ProductsListDto>> getAllProducts() async {
    try {
      Uri url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.getAllProduct}",
      );
      final token = await AppFlutterSecureStorage.getData("Token");

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(ProductsListDto.fromJson(json));
      } else {
        return Error(json["message"]);
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }
}
