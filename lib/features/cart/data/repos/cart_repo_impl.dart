import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, List<UserProductsEntity>>>
      getUserProductsData() async {
    List<UserProductsEntity> userProductsList;
    try {
      userProductsList = await cartRemoteDataSource.getUserProductsData();
      return right(userProductsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
