part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountSuccess extends AccountState {
  final UserDataEntity user;
  AccountSuccess(this.user);
}

class AccountError extends AccountState {
  final String error;
  AccountError(this.error);
}

class AccountUpdateLoading extends AccountState {}

class AccountUpdateSuccess extends AccountState {
  final String message;
  AccountUpdateSuccess(this.message);
}

class AccountUpdateError extends AccountState {
  final String error;
  AccountUpdateError(this.error);
}
