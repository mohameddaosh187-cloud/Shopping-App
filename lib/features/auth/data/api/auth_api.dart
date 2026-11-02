import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/api_constants.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';

abstract class AuthApi {
  static Future<ApiResult<String>> register(
    RegisterRequestModel request,
  ) async {
    try {
      Uri url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.register}");
      var response = await http.post(
        url,
        body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return Success(json["message"]);
      } else {
        return Error("Error From Server");
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }
}
