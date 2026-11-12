// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shopping_app/features/account/data/api/account_api.dart'
    as _i72;
import 'package:shopping_app/features/account/data/repo/account_data_source_imp.dart'
    as _i166;
import 'package:shopping_app/features/account/data/repo/account_repo_imp.dart'
    as _i154;
import 'package:shopping_app/features/account/domain/repo/account_data_source_interface.dart'
    as _i845;
import 'package:shopping_app/features/account/domain/repo/account_repo_interface.dart'
    as _i416;
import 'package:shopping_app/features/account/domain/use_case/get_user_data_use_case.dart'
    as _i454;
import 'package:shopping_app/features/account/domain/use_case/update_data_user_use_case.dart'
    as _i241;
import 'package:shopping_app/features/account/presentation/view_model/account_cubit.dart'
    as _i588;
import 'package:shopping_app/features/home/data/repo/home_data_source_imp.dart'
    as _i797;
import 'package:shopping_app/features/home/data/repo/home_repo_imp.dart'
    as _i529;
import 'package:shopping_app/features/home/domain/repo/home_data_source_interface.dart'
    as _i879;
import 'package:shopping_app/features/home/domain/repo/home_repo_interface.dart'
    as _i191;
import 'package:shopping_app/features/home/domain/use_case/get_all_categories_use_case.dart'
    as _i634;
import 'package:shopping_app/features/home/domain/use_case/get_all_products_use_case.dart'
    as _i219;
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart'
    as _i381;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i72.AccountApi>(() => _i72.AccountApi());
    gh.factory<_i845.AccountDataSourceInterface>(
      () => _i166.AccountDataSourceImp(gh<_i72.AccountApi>()),
    );
    gh.factory<_i879.HomeDataSourceInterface>(() => _i797.HomeDataSourceImp());
    gh.factory<_i416.AccountRepoInterface>(
      () => _i154.AccountRepoImp(gh<_i845.AccountDataSourceInterface>()),
    );
    gh.factory<_i191.HomeRepoInterface>(
      () => _i529.HomeRepoImp(gh<_i879.HomeDataSourceInterface>()),
    );
    gh.factory<_i454.GetUserDataUseCase>(
      () => _i454.GetUserDataUseCase(gh<_i416.AccountRepoInterface>()),
    );
    gh.factory<_i241.UpdateDataUserUseCase>(
      () => _i241.UpdateDataUserUseCase(gh<_i416.AccountRepoInterface>()),
    );
    gh.factory<_i588.AccountCubit>(
      () => _i588.AccountCubit(
        gh<_i454.GetUserDataUseCase>(),
        gh<_i241.UpdateDataUserUseCase>(),
      ),
    );
    gh.factory<_i634.GetAllCategoriesUseCase>(
      () => _i634.GetAllCategoriesUseCase(gh<_i191.HomeRepoInterface>()),
    );
    gh.factory<_i219.GetAllProductsUseCase>(
      () => _i219.GetAllProductsUseCase(gh<_i191.HomeRepoInterface>()),
    );
    gh.factory<_i381.HomeCubit>(
      () => _i381.HomeCubit(
        gh<_i634.GetAllCategoriesUseCase>(),
        gh<_i219.GetAllProductsUseCase>(),
      ),
    );
    return this;
  }
}
