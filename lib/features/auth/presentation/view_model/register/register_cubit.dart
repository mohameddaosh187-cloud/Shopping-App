import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/auth/data/api/auth_api.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? massageSuccess;
  String? massageError;

  Future<void> register(RegisterRequestModel request) async {
    emit(RegisterLoading());
    final result = await AuthApi.register(request);
    switch (result) {
      case Success<String>():
        massageSuccess = result.data;
        emit(RegisterSuccess());
      case Error<String>():
        massageError = result.error;
        emit(RegisterError());
    }
  }
}
