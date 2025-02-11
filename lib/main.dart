import 'package:dubisign_task_clean_arch/constants.dart';
import 'package:dubisign_task_clean_arch/core/main_pages/cubit/nav_bar_cubit.dart';
import 'package:dubisign_task_clean_arch/core/utils/blocObserver/bloc_observer.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/functions/setup_service_locator.dart';
import 'package:dubisign_task_clean_arch/core/utils/keyboard_close_observer.dart';
import 'package:dubisign_task_clean_arch/core/utils/navigation_bar_view.dart';
import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_products_use_Case.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/use_cases/get_specific_category_products_use_case.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_categories_cubit/get_categories_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_specific_category_products/get_specific_category_products_cubit.dart';
import 'package:flutter/services.dart' as services;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  setupServiceLocator();

  await Hive.openBox<ProductEntity>(KproductsBox);
  await Hive.openBox<dynamic>(KcategoriesBox);

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return GetCategoriesCubit(
              GetCategoriesUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..getCategories();
          },
        ),
        BlocProvider(
          create: (context) {
            return GetProductsCubit(
              GetProductsUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..getProducts();
          },
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AnnotatedRegion(
            value: const services.SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.black,
            ),
            child: KeyboardPopScaffold(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => NavBarCubit(),
                  ),
                  // BlocProvider(
                  //   create: (context) => HomeCubit()
                  //     ..getProducts()
                  //     ..getCategories(),
                  // ),
                ],
                child: MaterialApp(
                  title: 'Dubisign Task',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    fontFamily: 'Poppins',
                    scaffoldBackgroundColor: ColorsStyles.whiteColor,
                    primaryColor: kPrimaryColor,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    useMaterial3: true,
                  ),
                  onGenerateRoute: onGenerateRoute,
                  navigatorKey: navigatorKey,
                  home: const NavBarView(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
