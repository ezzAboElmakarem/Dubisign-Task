import 'package:dubisign_task_clean_arch/core/utils/functions/setup_service_locator.dart';
import 'package:dubisign_task_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_specific_category_products_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_specific_category_products/get_specific_category_products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/colors_styles.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';
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
    // List<dynamic> modifiedCategoriesList = [
    //   // "  All  ",
    //   // ...
    //   widget.categoriesList
    // ];

    return BlocProvider(
      create: (context) => GetSpecificCategoryProductsCubit(
        GetSpecificCategoryProductsUseCase(getIt.get<HomeRepoImpl>()),
        categories: widget.categoriesList,
        // categoryName: "electronics"
      ),
      child: BlocConsumer<GetSpecificCategoryProductsCubit,
          GetSpecificCategoryProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = GetSpecificCategoryProductsCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h),
            child: SizedBox(
              height: 66.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.categoriesList.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        cubit.getProducts(categoryNameIndex: index);
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
                                    color: ColorsStyles.hintColor
                                        .withOpacity(0.16),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8),
                            child: Text(
                              cubit.categoriesList[index],
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
          // if (state is GetSpecificCategoryProductsSuccess) {
          //   return Padding(
          //     padding: EdgeInsets.symmetric(vertical: 26.h),
          //     child: SizedBox(
          //       height: 66.h,
          //       child: ListView.separated(
          //         padding: EdgeInsets.symmetric(horizontal: 14.w),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: cubit.categoriesList.length,
          //         separatorBuilder: (context, index) =>
          //             const SizedBox(width: 12),
          //         itemBuilder: (context, index) {
          //           bool isSelected = selectedIndex == index;
          //           return Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10.h),
          //             child: InkWell(
          //               onTap: () {
          //                 cubit.getProducts(categoryNameIndex: index);
          //                 setState(() {
          //                   selectedIndex = index;
          //                 });
          //               },
          //               child: Container(
          //                 height: 38.h,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(26),
          //                   color: isSelected
          //                       ? ColorsStyles.whiteColor
          //                       : ColorsStyles.greyColor,
          //                   boxShadow: [
          //                     isSelected
          //                         ? BoxShadow(
          //                             color: ColorsStyles.hintColor
          //                                 .withOpacity(0.16),
          //                             spreadRadius: 0,
          //                             blurRadius: 15,
          //                           )
          //                         : const BoxShadow(
          //                             color: Colors.transparent,
          //                             spreadRadius: 0,
          //                             blurRadius: 0,
          //                           ),
          //                   ],
          //                 ),
          //                 child: Center(
          //                   child: Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 12.w, vertical: 8),
          //                     child: Text(
          //                       cubit.categoriesList[index],
          //                       style: AppStyles.styleMedium18()
          //                           .copyWith(color: ColorsStyles.blackColor),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   );
          // } else if (state is GetSpecificCategoryProductsFailure) {
          //   return Text(state.errMessage);
          // } else {
          //   return Padding(
          //     padding: EdgeInsets.symmetric(vertical: 26.h),
          //     child: SizedBox(
          //       height: 66.h,
          //       child: ListView.separated(
          //         padding: EdgeInsets.symmetric(horizontal: 14.w),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: cubit.categoriesList.length,
          //         separatorBuilder: (context, index) =>
          //             const SizedBox(width: 12),
          //         itemBuilder: (context, index) {
          //           bool isSelected = selectedIndex == index;
          //           return Padding(
          //             padding: EdgeInsets.symmetric(vertical: 10.h),
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   selectedIndex = index;
          //                 });
          //                 cubit.getProducts(categoryNameIndex: index);
          //               },
          //               child: Container(
          //                 height: 38.h,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(26),
          //                   color: isSelected
          //                       ? ColorsStyles.whiteColor
          //                       : ColorsStyles.greyColor,
          //                   boxShadow: [
          //                     isSelected
          //                         ? BoxShadow(
          //                             color: ColorsStyles.hintColor
          //                                 .withOpacity(0.16),
          //                             spreadRadius: 0,
          //                             blurRadius: 15,
          //                           )
          //                         : const BoxShadow(
          //                             color: Colors.transparent,
          //                             spreadRadius: 0,
          //                             blurRadius: 0,
          //                           ),
          //                   ],
          //                 ),
          //                 child: Center(
          //                   child: Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 12.w, vertical: 8),
          //                     child: Text(
          //                       cubit.categoriesList[index],
          //                       style: AppStyles.styleMedium18()
          //                           .copyWith(color: ColorsStyles.blackColor),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   );
          // }
        },
      ),
    );
  }
}
