import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';

abstract class AccountDataSourceInterface {
  Future<ApiResult<UserDataEntity>> getUserData();
}
