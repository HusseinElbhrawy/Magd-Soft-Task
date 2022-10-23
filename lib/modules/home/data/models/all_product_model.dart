// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:magd_soft_task/modules/home/data/models/product_model.dart';
import 'package:magd_soft_task/modules/home/domain/entities/all_products_entity.dart';

class AllProductModel extends AllProductsEntity {
  const AllProductModel({
    required super.status,
    required super.message,
    required super.products,
  });

  AllProductModel copyWith({
    int? status,
    String? message,
    List<ProductModel>? products,
  }) {
    return AllProductModel(
      status: status ?? this.status,
      message: message ?? this.message,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'products': products.map((x) => x).toList(),
    };
  }

  factory AllProductModel.fromMap(Map<String, dynamic> map) {
    return AllProductModel(
      status: map['status'] as int,
      message: map['message'] as String,
      products: List<ProductModel>.from(
        (map['products'] as List<int>).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllProductModel.fromJson(String source) =>
      AllProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AllProductModel(status: $status, message: $message, products: $products)';

  @override
  bool operator ==(covariant AllProductModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ products.hashCode;
}
