import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/api_constants.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/core/utils/app_flutter_secure_storage.dart';
import 'package:shopping_app/features/account/data/models/user_data_dto.dart';

class AccountApi {
  static Future<ApiResult<UserDataDto>> getUserData() async {
    try {
      Uri url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.getUserData}");
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
        return Success(UserDataDto.fromJson(json));
      } else {
        return Error(json["message"]);
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }
}
