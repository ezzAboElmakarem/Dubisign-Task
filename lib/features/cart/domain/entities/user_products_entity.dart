import 'package:dubisign_task_clean_arch/features/cart/data/models/user_products_model/product.dart';

class UserProductsEntity {
  final int? cartId;
  final List<Product>? userProducts;

  UserProductsEntity({required this.cartId, required this.userProducts});
}
