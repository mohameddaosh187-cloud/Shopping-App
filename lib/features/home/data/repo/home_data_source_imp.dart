import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/api/home_api.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/model/products_list_model.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';
import 'package:shopping_app/features/home/domain/repo/home_data_source_interface.dart';

class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ApiResult<CategoriesListEntity>> getAllCategories() async {
    final result = await HomeApi.getAllCategories();
    switch (result) {
      case Success<CategoriesListDto>():
        return Success(result.data.toEntity());
      case Error<CategoriesListDto>():
        return Error(result.error);
    }
  }

  @override
  Future<ApiResult<ProductsListEntity>> getAllProducts() async {
    final result = await HomeApi.getAllProducts();
    switch (result) {
      case Success<ProductsListDto>():
        return Success(result.data.toEntity());
      case Error<ProductsListDto>():
        return Error(result.error);
    }
  }
}
