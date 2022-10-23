// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:magd_soft_task/modules/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.company,
    required super.name,
    required super.type,
    required super.price,
    required super.image,
    required super.description,
  });

  ProductModel copyWith({
    int? id,
    String? company,
    String? name,
    String? type,
    String? price,
    String? image,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      company: company ?? this.company,
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'company': company,
      'name': name,
      'type': type,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      company: map['company'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, company: $company, name: $name, type: $type, price: $price, image: $image, description: $description)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.company == company &&
        other.name == name &&
        other.type == type &&
        other.price == price &&
        other.image == image &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        company.hashCode ^
        name.hashCode ^
        type.hashCode ^
        price.hashCode ^
        image.hashCode ^
        description.hashCode;
  }
}
