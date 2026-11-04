import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/model/categories_list_model.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final HomeRepoInterface repo;

  Future<void> getAllCategories() async {
    emit(HCLoading());
    final result = await repo.getAllCategories();
    switch (result) {
      case Success<CategoriesList>():
        emit(HCSuccess(categoriesList: result.data.list ?? []));
      case Error<CategoriesList>():
        emit(HCError(message: result.error));
    }
  }
}
