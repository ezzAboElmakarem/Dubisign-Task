import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_specific_category_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_specific_category_products_state.dart';

class GetSpecificCategoryProductsCubit
    extends Cubit<GetSpecificCategoryProductsState> {
  GetSpecificCategoryProductsCubit(this.getProductsUseCase, this.categoryName)
      : super(GetSpecificCategoryProductsInitial());
  static GetSpecificCategoryProductsCubit get(context) =>
      BlocProvider.of(context);
  //------------------------------Variables----------------------------------
  String categoryName;
  List<ProductEntity> productsData = [];
  final GetSpecificCategoryProductsUseCase getProductsUseCase;
  //------------------------------Functions----------------------------------

  Future<void> getProducts() async {
    emit(GetSpecificCategoryProductsLoading());
    var results = await getProductsUseCase.call(categoryName);
    results.fold((failure) {
      emit(GetSpecificCategoryProductsFailure(failure.message));
    }, (products) {
      productsData.addAll(products);
      emit(GetSpecificCategoryProductsSuccess(products));
    });
  }
}
