import 'package:dartz/dartz.dart';
import '../error/errors.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
