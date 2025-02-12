import 'dart:developer';

import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/home_cubit_states.dart';
import '../utils/colors_styles.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListview extends StatefulWidget {
  final List<dynamic> categoriesList;

  const CategoriesListview({super.key, required this.categoriesList});

  @override
  State<CategoriesListview> createState() => _CategoriesListviewState();
}

class _CategoriesListviewState extends State<CategoriesListview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetSpecificCategoryProductsFailure) {
          log("Error: ${state.error}");
        }
      },
      child: buildListView(context, widget.categoriesList),
    );
  }

  Widget buildListView(BuildContext context, List<dynamic> categories) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h),
      child: SizedBox(
        height: 66.h,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: InkWell(
                onTap: () {
                  log("Category selected: ${categories[index]}");
                  setState(() {
                    selectedIndex = index;
                  });
                  context.read<HomeCubit>().getProductsByCategory(index);
                },
                child: Container(
                  height: 38.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: isSelected
                        ? ColorsStyles.whiteColor
                        : ColorsStyles.greyColor,
                    boxShadow: [
                      isSelected
                          ? BoxShadow(
                              color: ColorsStyles.hintColor.withOpacity(0.16),
                              spreadRadius: 0,
                              blurRadius: 15,
                            )
                          : const BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 0,
                              blurRadius: 0,
                            ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
                      child: Text(
                        categories[index],
                        style: AppStyles.styleMedium18()
                            .copyWith(color: ColorsStyles.blackColor),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
