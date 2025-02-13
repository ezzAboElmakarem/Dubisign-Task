import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, List<UserProductsEntity>>> getUserProductsData();
}
