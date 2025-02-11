import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserEntity>> getUserData();
  Future<Either<Failure, List<dynamic>>> getCategoriesData();
  Future<Either<Failure, List<ProductEntity>>> getProductsData();
  Future<Either<Failure, List<ProductEntity>>> getSpecificCategoryProducts(
      {required String categoryName});
}
