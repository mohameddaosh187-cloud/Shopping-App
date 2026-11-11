import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/data/repo/account_repo_imp.dart';
import 'package:shopping_app/features/account/domain/repo/account_repo_interface.dart';

class UpdateDataUserUseCase {
  final AccountRepoInterface _repo;
  UpdateDataUserUseCase(this._repo);

  Future<ApiResult<String>> invoke({
    required String name,
    required String image,
    required String phone,
  }) async =>
      await _repo.updateDataUser(name: name, image: image, phone: phone);
}

UpdateDataUserUseCase injectableUpdateDataUserUseCase() =>
    UpdateDataUserUseCase(injectableAccountRepo());
