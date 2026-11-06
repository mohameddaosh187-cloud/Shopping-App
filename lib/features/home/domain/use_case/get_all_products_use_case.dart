import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';
import 'package:shopping_app/features/home/domain/repo/home_repo_interface.dart';

class GetAllProductsUseCase {
  final HomeRepoInterface _repo;
  GetAllProductsUseCase(this._repo);
  Future<ApiResult<ProductsListEntity>> invoke() async =>
      await _repo.getAllProducts();
}
