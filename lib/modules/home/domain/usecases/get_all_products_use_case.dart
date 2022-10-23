import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetAllProductsUseCase extends UseCases<List<ProductEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await homeRepository.getAllProducts();
  }
}
