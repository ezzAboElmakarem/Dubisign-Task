part of 'get_categories_cubit.dart';

@immutable
sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

class CategoriesLoading extends GetCategoriesState {}

class CategoriesPaginationLoading extends GetCategoriesState {}

class CategoriesPaginationFailure extends GetCategoriesState {
  final String errMessage;

  CategoriesPaginationFailure(this.errMessage);
}

class CategoriesFailure extends GetCategoriesState {
  final String errMessage;

  CategoriesFailure(this.errMessage);
}

class CategoriesSuccess extends GetCategoriesState {
  final List<dynamic> categories;

  CategoriesSuccess(this.categories);
}
