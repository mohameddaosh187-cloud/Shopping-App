import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';
import 'package:shopping_app/features/account/domain/use_case/get_user_data_use_case.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._getUserDataUseCase) : super(AccountInitial());
  final GetUserDataUseCase _getUserDataUseCase;

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
}
