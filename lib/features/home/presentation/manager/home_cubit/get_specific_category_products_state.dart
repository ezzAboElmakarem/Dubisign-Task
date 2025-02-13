part of 'get_specific_category_products_cubit.dart';

@immutable
sealed class GetSpecificCategoryProductsState {}

final class GetSpecificCategoryProductsInitial
    extends GetSpecificCategoryProductsState {}

class GetSpecificCategoryProductsLoading
    extends GetSpecificCategoryProductsState {}

class GetSpecificCategoryProductsFailure
    extends GetSpecificCategoryProductsState {
  final String errMessage;

  GetSpecificCategoryProductsFailure(this.errMessage);
}

class GetSpecificCategoryProductsSuccess
    extends GetSpecificCategoryProductsState {
  final List<ProductEntity> products;

  GetSpecificCategoryProductsSuccess(this.products);
}
