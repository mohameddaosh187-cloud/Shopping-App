import 'package:injectable/injectable.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';
import 'package:shopping_app/features/account/domain/repo/account_repo_interface.dart';

@injectable
class GetUserDataUseCase {
  final AccountRepoInterface _repo;
  GetUserDataUseCase(this._repo);
  Future<ApiResult<UserDataEntity>> invoke() async => await _repo.getUserData();
}
