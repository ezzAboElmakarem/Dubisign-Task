import 'dart:developer';

import 'package:dubisign_task_clean_arch/features/cart/data/models/user_products_model/product.dart';
import 'package:dubisign_task_clean_arch/features/cart/data/models/user_products_model/user_products_model.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/cart_product_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/use_cases/get_user_products_data_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetProductsUseCase getProductsUseCase;
  final GetUserProductsUseCase getUserProductsUseCase;
  late final HomeLocalDataSource homeLocalDataSource =
      HomeLocalDataSourceImpl();

  List<ProductEntity> allProducts = [];
  List<UserProductsEntity> userCartHistory = [];
  List<Product> userProducts = [];
  List<CartProductEntity> cartProducts = [];

  CartCubit(
      {required this.getProductsUseCase, required this.getUserProductsUseCase})
      : super(CartInitial()) {
    allProducts = homeLocalDataSource.getProductsData();
  }

  static CartCubit get(context) => BlocProvider.of(context);

  //------------------------------Functions----------------------------------

  /// Fetch User products
  Future<void> getUserProducts() async {
    emit(UserProductsLoading());
    var result = await getUserProductsUseCase.call();
    result.fold(
      (failure) {
        log("Error fetching user products: ${failure.message}");
        emit(UserProductsFailure(failure.message));
      },
      (response) {
        // Convert response to List<UserProductsEntity>
        userCartHistory = response
            .map((e) =>
                UserProductsModel.fromJson((e as UserProductsModel).toJson()))
            .toList();

        log("${userCartHistory.first}");
        userProducts = userCartHistory.first.userProducts ?? [];

        cartProducts = userProducts
            .map((e) => CartProductEntity(
                  productEntity: allProducts.firstWhere(
                    (element) => e.productId == element.productId,
                  ),
                  productQuantatiy: e.quantity,
                ))
            .toList();

        log("User cart products: $cartProducts");
        emit(UserProductsSuccess(cartProducts));
      },
    );
  }

  void removeProductFromCart(CartProductEntity product) {
    cartProducts.removeWhere((item) =>
        item.productEntity.productId == product.productEntity.productId);
    emit(UserProductsSuccess(List.from(cartProducts)));
  }

  void updateProductQuantity(CartProductEntity product, int newQuantity) {
    int index = cartProducts.indexWhere(
      (item) => item.productEntity.productId == product.productEntity.productId,
    );

    if (index != -1) {
      cartProducts[index] = CartProductEntity(
        productEntity: cartProducts[index].productEntity,
        productQuantatiy: newQuantity,
      );
      emit(UserProductsSuccess(List.from(cartProducts))); // Emit new state
    }
  }
}
