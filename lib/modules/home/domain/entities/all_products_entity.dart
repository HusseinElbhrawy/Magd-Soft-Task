import 'package:equatable/equatable.dart';
import 'product_entity.dart';

class AllProductsEntity extends Equatable {
  final int status;
  final String message;
  final List<ProductEntity> products;

  const AllProductsEntity({
    required this.status,
    required this.message,
    required this.products,
  });
  @override
  List<Object?> get props => [
        status,
        message,
        products,
      ];
}
