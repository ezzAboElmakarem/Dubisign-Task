import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/advert_banner.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/categories_list_view_bloc_builder.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/home_app_bar.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/products_gridview_bloc_builder.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/widgets/search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HomeAppBar(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchFormField(),
            AdvertBanner(),
            CategoriesListViewBlocBuilder(),
            ProductsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
