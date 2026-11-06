import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/model/products_list_model.dart';

abstract class HomeRepoInterface {
  Future<ApiResult<CategoriesList>> getAllCategories();
  Future<ApiResult<ProductsList>> getAllProducts();
}
