import 'package:dubisign_task_clean_arch/core/utils/api_service.dart';
import 'package:dubisign_task_clean_arch/features/cart/data/models/user_products_model/user_products_model.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';

abstract class CartRemoteDataSource {
  Future<List<UserProductsEntity>> getUserProductsData();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<UserProductsEntity>> getUserProductsData() async {
    var data = await apiService.get(endPoint: "carts?userId=1");

    // Ensure data is a List
    if (data is! List) {
      throw Exception("Unexpected response format");
    }

    // Convert the list of dynamic maps into a list of ProductsModel and then to ProductEntity
    List<UserProductsEntity> userProducts =
        data.map((json) => UserProductsModel.fromJson(json)).toList();
    return userProducts;
  }
}
