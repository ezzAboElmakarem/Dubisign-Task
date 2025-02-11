import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.getCategoriesUseCase) : super(GetCategoriesInitial());

  static GetCategoriesCubit get(context) => BlocProvider.of(context);

  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await getCategoriesUseCase.call();
    result.fold(
      (failure) {
        emit(CategoriesFailure(failure.message));
      },
      (category) {
        emit(CategoriesSuccess(category));
      },
    );
  }
}
