import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/core/use_cases/use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/repos/home_repo.dart';

class GetSpecificCategoryProductsUseCase
    extends UseCase<List<ProductEntity>, String> {
  final HomeRepo homeRepo;

  GetSpecificCategoryProductsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call([String? param]) {
    return homeRepo.getSpecificCategoryProducts(categoryName: param ?? '');
  }
}
