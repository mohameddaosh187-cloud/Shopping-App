import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/model/products_list_model.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_interface.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface dataSource;
  HomeRepoImp(this.dataSource);
  @override
  Future<ApiResult<CategoriesList>> getAllCategories() async =>
      await dataSource.getAllCategories();

  @override
  Future<ApiResult<ProductsList>> getAllProducts() async =>
      await dataSource.getAllProducts();
}
