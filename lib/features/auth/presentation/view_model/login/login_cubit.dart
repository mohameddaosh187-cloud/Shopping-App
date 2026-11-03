import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/auth/data/api/auth_api.dart';
import 'package:shopping_app/features/auth/data/models/login_response_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginResponseModel? loginResponseModel;
  String? errorMassage;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await AuthApi.login(email, password);
    switch (result) {
      case Success<LoginResponseModel>():
        loginResponseModel = result.data;
        emit(LoginSuccess());
      case Error<LoginResponseModel>():
        errorMassage = result.error;
        emit(LoginError());
    }
  }
}
