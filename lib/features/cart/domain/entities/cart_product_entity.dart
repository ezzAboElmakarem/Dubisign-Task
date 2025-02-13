import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';

class CartProductEntity {
  final ProductEntity productEntity;
  final int? productQuantatiy;

  CartProductEntity({
    required this.productEntity,
    required this.productQuantatiy,
  });

  @override
  String toString() {
    return '{product: ${productEntity.toString()}, quantity: $productQuantatiy}';
  }
}
