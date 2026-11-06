import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';
import 'package:shopping_app/features/account/domain/repo/account_data_source_interface.dart';
import 'package:shopping_app/features/account/domain/repo/account_repo_interface.dart';

class AccountRepoImp implements AccountRepoInterface {
  final AccountDataSourceInterface _dataSource;
  AccountRepoImp(this._dataSource);

  @override
  Future<ApiResult<UserDataEntity>> getUserData() async =>
      await _dataSource.getUserData();
}
