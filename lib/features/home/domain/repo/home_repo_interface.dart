import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';

abstract class HomeRepoInterface {
  Future<ApiResult<CategoriesListEntity>> getAllCategories();
  Future<ApiResult<ProductsListEntity>> getAllProducts();
}
