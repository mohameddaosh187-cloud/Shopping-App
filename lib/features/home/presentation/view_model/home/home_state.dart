part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HCLoading extends HomeState {}

class HCError extends HomeState {
  final String message;
  HCError({required this.message});
}

class HCSuccess extends HomeState {
  final List<CategoryModel> categoriesList;
  HCSuccess({required this.categoriesList});
}

class HPLoading extends HomeState {}

class HPError extends HomeState {
  final String message;
  HPError({required this.message});
}

class HPSuccess extends HomeState {
  final List<ProductModel> categoriesList;
  HPSuccess({required this.categoriesList});
}
