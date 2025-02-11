import 'dart:developer';

import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsCubit, GetProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = GetProductsCubit.get(context);

        if (state is ProductsSuccess) {
          log(cubit.productsData[1].productName.toString());
          log(cubit.productsData[1].productDescription.toString());

          return ProductsGridView(
            cubit: cubit,
          );
        } else if (state is ProductsFailure) {
          return Text(state.errMessage);
        } else if (state is ProductsLoading) {
          return CircularProgressIndicator();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
