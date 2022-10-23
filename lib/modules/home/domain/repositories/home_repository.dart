import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
