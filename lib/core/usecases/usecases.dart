import 'package:dartz/dartz.dart';
import 'package:magd_soft_task/core/error/errors.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
