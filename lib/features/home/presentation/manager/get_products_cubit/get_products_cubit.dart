import 'package:bloc/bloc.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_products_use_Case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_poducts_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.getProductsUseCase) : super(GetPoductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);
  //------------------------------Variables----------------------------------

  List<ProductEntity> productsData = [];
  final GetProductsUseCase getProductsUseCase;
  //------------------------------Functions----------------------------------

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var results = await getProductsUseCase.call();
    results.fold((failure) {
      emit(ProductsFailure(failure.message));
    }, (products) {
      productsData.addAll(products);
      emit(ProductsSuccess(products));
    });
  }
}
