import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/core/use_cases/use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/repos/home_repo.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>, void> {
  final HomeRepo homeRepo;

  GetProductsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([void param]) async {
    return await homeRepo.getProductsData();
  }
}
