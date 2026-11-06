import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';
import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';
import 'package:shopping_app/features/home/domain/use_case/get_all_categories_use_case.dart';
import 'package:shopping_app/features/home/domain/use_case/get_all_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAllCategoriesUseCase, this._getAllProductsUseCase)
    : super(HomeInitial());
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;

  Future<void> getAllCategories() async {
    emit(HCLoading());
    final result = await _getAllCategoriesUseCase.invoke();
    switch (result) {
      case Success<CategoriesListEntity>():
        emit(HCSuccess(categoriesList: result.data.list));
      case Error<CategoriesListEntity>():
        emit(HCError(message: result.error));
    }
  }

  Future<void> getAllProducts() async {
    emit(HPLoading());
    final result = await _getAllProductsUseCase.invoke();
    switch (result) {
      case Success<ProductsListEntity>():
        emit(HPSuccess(categoriesList: result.data.list));
      case Error<ProductsListEntity>():
        emit(HPError(message: result.error));
    }
  }
}
