import 'dart:developer';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_specific_category_products_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;
  final GetSpecificCategoryProductsUseCase getSpecificCategoryProductsUseCase;

  List<dynamic> categoriesList = [];
  List<ProductEntity> allProducts = [];
  List<ProductEntity> categoryProducts = [];

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getProductsUseCase,
    required this.getSpecificCategoryProductsUseCase,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  //------------------------------Functions----------------------------------

  /// Fetch all categories
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await getCategoriesUseCase.call();
    result.fold(
      (failure) {
        log("Error fetching categories: ${failure.message}");
        emit(CategoriesFailure(failure.message));
      },
      (categories) {
        categoriesList = ["All", ...categories];
        log("Categories loaded: $categoriesList");
        emit(CategoriesSuccess(categoriesList));
      },
    );
  }

  /// Fetch all products
  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    var result = await getProductsUseCase.call();
    result.fold(
      (failure) {
        log("Error fetching all products: ${failure.message}");
        emit(ProductsFailure(failure.message));
      },
      (products) {
        allProducts = products;
        log("All products loaded: ${products.length} items");
        emit(ProductsSuccess(allProducts));
      },
    );
  }

  /// Fetch products for a selected category
  Future<void> getProductsByCategory(int categoryIndex) async {
    if (categoryIndex < 0 || categoryIndex >= categoriesList.length) {
      log("Invalid category index: $categoryIndex");
      return;
    }

    String categoryName = categoriesList[categoryIndex].toString();
    log("Fetching products for category: $categoryName");

    emit(GetSpecificCategoryProductsLoading());

    if (categoryName == "All") {
      log("Displaying all products.");
      emit(ProductsSuccess(allProducts));
      return;
    }

    var result = await getSpecificCategoryProductsUseCase.call(categoryName);

    result.fold(
      (failure) {
        log("Error fetching category products: ${failure.message}");
        emit(GetSpecificCategoryProductsFailure(failure.message));
      },
      (products) {
        log("Category '$categoryName' loaded: ${products.length} items");
        categoryProducts = products;
        emit(GetSpecificCategoryProductsSuccess(products));
      },
    );
  }
}
