import 'package:dio/dio.dart';
import 'package:dubisign_task_clean_arch/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:dubisign_task_clean_arch/features/cart/data/repos/cart_repo_impl.dart';
import 'package:dubisign_task_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dubisign_task_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:dubisign_task_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      cartRemoteDataSource: CartRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
