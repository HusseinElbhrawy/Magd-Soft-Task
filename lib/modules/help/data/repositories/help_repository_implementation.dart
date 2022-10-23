import '../../../../core/api/error_handler_codes.dart';
import '../datasources/help_remote_data_source.dart';
import '../../../../core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/item_help_entity.dart';
import '../../domain/repositories/help_repository.dart';

class HelpRepositoryImplementation implements HelpRepository {
  final HelpRemoteDataSource helpRemoteDataSource;

  HelpRepositoryImplementation({required this.helpRemoteDataSource});
  @override
  Future<Either<Failure, List<ItemHelpEntity>>> getHelp() async {
    try {
      final result = await helpRemoteDataSource.getHelp();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
