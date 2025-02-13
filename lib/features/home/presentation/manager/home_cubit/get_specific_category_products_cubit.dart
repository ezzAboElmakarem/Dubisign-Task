import 'dart:developer';

import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_specific_category_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_specific_category_products_state.dart';

class GetSpecificCategoryProductsCubit
    extends Cubit<GetSpecificCategoryProductsState> {
  final GetSpecificCategoryProductsUseCase getProductsUseCase;
  List<dynamic> categoriesList = [];
  List<ProductEntity> productsData = [];

  GetSpecificCategoryProductsCubit(this.getProductsUseCase,
      {required List<dynamic> categories})
      : super(GetSpecificCategoryProductsInitial()) {
    categoriesList = categories;
    log("Cubit initialized with categories: $categoriesList");
  }

  static GetSpecificCategoryProductsCubit get(context) =>
      BlocProvider.of(context);

  //------------------------------Functions----------------------------------

  Future<void> getProducts({required int categoryNameIndex}) async {
    emit(GetSpecificCategoryProductsLoading());
    log("Fetching products for category: $categoryNameIndex");

    var results = await getProductsUseCase
        .call(categoriesList[categoryNameIndex].toString());
    results.fold((failure) {
      emit(GetSpecificCategoryProductsFailure(failure.message));
    }, (products) {
      productsData = products;
      log("Success fetching category: $categoryNameIndex");
      emit(GetSpecificCategoryProductsSuccess(products));
    });
  }
}
