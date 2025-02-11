import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dubisign_task_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/user_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<dynamic>>> getCategoriesData() async {
    List<dynamic> categoriesList;
    try {
      categoriesList = homeLocalDataSource.getCategoriesData();
      if (categoriesList.isNotEmpty) {
        return right(categoriesList);
      }
      categoriesList = await homeRemoteDataSource.getCategoriesData();
      return right(categoriesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsData() async {
    List<ProductEntity> productsList;
    try {
      productsList = homeLocalDataSource.getProductsData();
      if (productsList.isNotEmpty) {
        return right(productsList);
      }
      productsList = await homeRemoteDataSource.getProductsData();
      return right(productsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSpecificCategoryProducts(
      {required String categoryName}) async {
    List<ProductEntity> productsList;
    try {
      productsList = await homeRemoteDataSource.getSpecificCategoryProducts(
          categoryName: categoryName);
      return right(productsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
}
