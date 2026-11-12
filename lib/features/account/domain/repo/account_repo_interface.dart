import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';

abstract class AccountRepoInterface {
  Future<ApiResult<UserDataEntity>> getUserData();
  Future<ApiResult<String>> updateDataUser({
    required String name,
    required String image,
    required String phone,
  });
}
