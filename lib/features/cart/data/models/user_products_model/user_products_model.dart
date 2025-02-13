import 'package:dubisign_task_clean_arch/features/cart/domain/entities/user_products_entity.dart';

import 'product.dart';
import 'dart:convert'; // Import for jsonEncode

class UserProductsModel extends UserProductsEntity {
  int? id;
  int? userId;
  DateTime? date;
  List<Product>? products;
  int? v;

  UserProductsModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  }) : super(cartId: id, userProducts: products);

  factory UserProductsModel.fromJson(Map<String, dynamic> json) {
    return UserProductsModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'date': date?.toIso8601String(),
        'products': products?.map((e) => e.toJson()).toList(),
        '__v': v,
      };

  @override
  String toString() => jsonEncode(toJson()); // Convert to JSON string
}
