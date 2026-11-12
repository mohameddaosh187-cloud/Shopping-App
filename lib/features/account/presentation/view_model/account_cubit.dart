import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';
import 'package:shopping_app/features/account/domain/use_case/get_user_data_use_case.dart';
import 'package:shopping_app/features/account/domain/use_case/update_data_user_use_case.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._getUserDataUseCase, this._updateDataUserUseCase)
    : super(AccountInitial());
  final GetUserDataUseCase _getUserDataUseCase;
  final UpdateDataUserUseCase _updateDataUserUseCase;

  Future<void> getUserData() async {
    emit(AccountLoading());
    try {
      final result = await _getUserDataUseCase.invoke();
      switch (result) {
        case Success<UserDataEntity>():
          emit(AccountSuccess(result.data));
        case Error<UserDataEntity>():
          emit(AccountError(result.error));
      }
    } catch (error) {
      emit(AccountError(error.toString()));
    }
  }

  Future<void> updateData({
    required String name,
    required String image,
    required String phone,
  }) async {
    emit(AccountUpdateLoading());
    final result = await _updateDataUserUseCase.invoke(
      name: name,
      image: image,
      phone: phone,
    );

    switch (result) {
      case Success<String>():
        emit(AccountUpdateSuccess(result.data));
      case Error<String>():
        emit(AccountUpdateError(result.error));
    }
  }
}
