import 'package:dubisign_task_clean_arch/constants.dart';
import 'package:dubisign_task_clean_arch/core/utils/api_service.dart';
import 'package:dubisign_task_clean_arch/features/home/data/models/products_model/products_model.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<UserEntity> getUserData();
  Future<List<dynamic>> getCategoriesData();
  Future<List<ProductEntity>> getProductsData();
  Future<List<ProductEntity>> getSpecificCategoryProducts(
      {required String categoryName});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductEntity>> getProductsData() async {
    var data = await apiService.get(endPoint: "products");

    // Ensure data is a List
    if (data is! List) {
      throw Exception("Unexpected response format");
    }

    // Convert the list of dynamic maps into a list of ProductsModel and then to ProductEntity
    List<ProductEntity> products =
        data.map((json) => ProductsModel.fromJson(json)).toList();

    // Cache products locally
    var box = Hive.box<ProductEntity>(KproductsBox);
    box.addAll(products);

    return products;
  }

  @override
  Future<List<dynamic>> getCategoriesData() async {
    var data =
        await apiService.get(endPoint: "products/categories") as List<dynamic>;
    List<dynamic> categories = data;

    // cash categories data local
    var box = Hive.box<dynamic>(KcategoriesBox);
    box.addAll(categories);
    return categories;
  }

  @override
  Future<List<ProductEntity>> getSpecificCategoryProducts(
      {required String categoryName}) async {
    var data =
        await apiService.get(endPoint: "products/category/$categoryName");

    // Ensure data is a List
    if (data is! List) {
      throw Exception("Unexpected response format");
    }

    // Convert the list of dynamic maps into a list of ProductsModel and then to ProductEntity
    List<ProductEntity> products =
        data.map((json) => ProductsModel.fromJson(json)).toList();

    return products;
  }

  @override
  Future<UserEntity> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
}
