import 'package:dubisign_task_clean_arch/constants.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  UserEntity getUserData();
  List<dynamic> getCategoriesData();
  List<ProductEntity> getProductsData();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<dynamic> getCategoriesData() {
    var box = Hive.box<dynamic>(KcategoriesBox);
    return box.values.toList();
  }

  @override
  List<ProductEntity> getProductsData() {
    var box = Hive.box<ProductEntity>(KproductsBox);
    return box.values.toList();
  }

  @override
  UserEntity getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
}
