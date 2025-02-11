import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String? productImage;
  @HiveField(3)
  final num? productPrice;
  @HiveField(4)
  final String? productDescription;
  ProductEntity({
    required this.productDescription,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });
}
