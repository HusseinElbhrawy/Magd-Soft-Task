import '../../../../core/api/error_handler_codes.dart';
import '../datasources/home_remote_data_source.dart';
import '../../domain/entities/product_entity.dart';
import '../../../../core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImplementation({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final result = await homeRemoteDataSource.getAllProduct();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
