import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';
import 'package:shopping_app/features/home/domain/repo/home_data_source_interface.dart';
import 'package:shopping_app/features/home/domain/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface dataSource;
  HomeRepoImp(this.dataSource);
  @override
  Future<ApiResult<CategoriesListEntity>> getAllCategories() async =>
      await dataSource.getAllCategories();

  @override
  Future<ApiResult<ProductsListEntity>> getAllProducts() async =>
      await dataSource.getAllProducts();
}
