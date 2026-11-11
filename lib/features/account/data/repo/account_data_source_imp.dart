import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/data/api/account_api.dart';
import 'package:shopping_app/features/account/data/models/user_data_dto.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';
import 'package:shopping_app/features/account/domain/repo/account_data_source_interface.dart';

class AccountDataSourceImp implements AccountDataSourceInterface {
  final AccountApi _api;
  AccountDataSourceImp(this._api);
  @override
  Future<ApiResult<UserDataEntity>> getUserData() async {
    final resDto = await _api.getUserData();
    switch (resDto) {
      case Success<UserDataDto>():
        return Success(resDto.data.toEntity());
      case Error<UserDataDto>():
        return Error(resDto.error);
    }
  }

  @override
  Future<ApiResult<String>> updateDataUser({
    required String name,
    required String image,
    required String phone,
  }) async {
    return await _api.updateDataUser(name: name, image: image, phone: phone);
  }
}

AccountDataSourceInterface injectableAccountDataSource() =>
    AccountDataSourceImp(injectableAccountApi());
