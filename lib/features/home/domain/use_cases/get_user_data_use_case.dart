import 'package:dartz/dartz.dart';
import 'package:dubisign_task_clean_arch/core/errors/failure.dart';
import 'package:dubisign_task_clean_arch/core/use_cases/use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/user_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/repos/home_repo.dart';

class GetUserDataUseCase extends UseCase<UserEntity, void> {
  final HomeRepo homeRepo;

  GetUserDataUseCase(this.homeRepo);
  @override
  Future<Either<Failure, UserEntity>> call([void param]) async {
    return await homeRepo.getUserData();
  }
}
