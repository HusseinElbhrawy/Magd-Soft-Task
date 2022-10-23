import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String description;

  const ProductEntity({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });
  @override
  List<Object?> get props => [
        id,
        company,
        name,
        type,
        price,
        image,
        description,
      ];
}
