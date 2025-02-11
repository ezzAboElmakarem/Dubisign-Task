part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetPoductsInitial extends GetProductsState {}

class ProductsLoading extends GetProductsState {}

class ProductsPaginationLoading extends GetProductsState {}

class ProductsPaginationFailure extends GetProductsState {
  final String errMessage;

  ProductsPaginationFailure(this.errMessage);
}

class ProductsFailure extends GetProductsState {
  final String errMessage;

  ProductsFailure(this.errMessage);
}

class ProductsSuccess extends GetProductsState {
  final List<ProductEntity> products;

  ProductsSuccess(this.products);
}
