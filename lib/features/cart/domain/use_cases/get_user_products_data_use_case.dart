import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/core/use_cases/use_case.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/repos/cart_repo.dart';

class GetUserProductsUseCase extends UseCase<List<UserProductsEntity>, void> {
  final CartRepo cartRepo;

  GetUserProductsUseCase(this.cartRepo);

  @override
  Future<Either<Failure, List<UserProductsEntity>>> call([void param]) async {
    return await cartRepo.getUserProductsData();
  }
}
