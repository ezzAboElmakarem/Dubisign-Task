import 'package:dubisign_task_clean_arch/core/widgets/Categories_listview.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListViewBlocBuilder extends StatelessWidget {
  const CategoriesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return CategoriesListview(
            categoriesList: state.categories,
          );
        } else if (state is CategoriesFailure) {
          return Text(state.error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
