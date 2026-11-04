import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';
import 'package:shopping_app/features/auth/data/repo/repo/auth_repo_interface.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.repo) : super(RegisterInitial());
  final AuthRepoInterface repo;
  String? massageSuccess;
  String? massageError;

  Future<void> register(RegisterRequestModel request) async {
    emit(RegisterLoading());
    final result = await repo.register(request);
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
