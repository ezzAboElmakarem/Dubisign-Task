part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

// All Products States

class ProductsLoading extends CartState {}

class ProductsSuccess extends CartState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}

class ProductsFailure extends CartState {
  final String error;
  ProductsFailure(this.error);
}

// user Products States
class UserProductsLoading extends CartState {}

class UserProductsSuccess extends CartState {
  final List<CartProductEntity> userProducts;
  UserProductsSuccess(this.userProducts);
}

class UserProductsFailure extends CartState {
  final String error;
  UserProductsFailure(this.error);
}
