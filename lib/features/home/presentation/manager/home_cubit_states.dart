import 'package:flutter/material.dart';

import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// Categories States
class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<dynamic> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesFailure extends HomeState {
  final String error;
  CategoriesFailure(this.error);
}

// All Products States
class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}

class ProductsFailure extends HomeState {
  final String error;
  ProductsFailure(this.error);
}

// Products by Category States
class GetSpecificCategoryProductsLoading extends HomeState {}

class GetSpecificCategoryProductsSuccess extends HomeState {
  final List<ProductEntity> products;
  GetSpecificCategoryProductsSuccess(this.products);
}

class GetSpecificCategoryProductsFailure extends HomeState {
  final String error;
  GetSpecificCategoryProductsFailure(this.error);
}
