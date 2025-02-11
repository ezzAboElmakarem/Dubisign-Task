import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/core/use_cases/use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/repos/home_repo.dart';

class GetCategoriesUseCase extends UseCase<List<dynamic>, void> {
  final HomeRepo homeRepo;

  GetCategoriesUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<dynamic>>> call([void param]) async {
    return await homeRepo.getCategoriesData();
  }
}
