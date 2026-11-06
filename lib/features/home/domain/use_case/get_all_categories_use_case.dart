import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/domain/repo/home_repo_interface.dart';

class GetAllCategoriesUseCase {
  final HomeRepoInterface _repo;
  GetAllCategoriesUseCase(this._repo);
  Future<ApiResult<CategoriesListEntity>> invoke() async =>
      await _repo.getAllCategories();
}
