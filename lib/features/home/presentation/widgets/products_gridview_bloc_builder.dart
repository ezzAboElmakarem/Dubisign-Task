import 'dart:developer';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit_states.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductsSuccess) {
          log("All products loaded: ${state.products.length} items");
          return ProductsGridView(products: state.products);
        } else if (state is GetSpecificCategoryProductsSuccess) {
          log("Category products loaded: ${state.products.length} items");
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure ||
            state is GetSpecificCategoryProductsFailure) {
          return Center(
              child: Text(
                  "Error: ${state is ProductsFailure ? state.error : (state as GetSpecificCategoryProductsFailure).error}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
