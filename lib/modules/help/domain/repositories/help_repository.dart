import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../entities/item_help_entity.dart';

abstract class HelpRepository {
  Future<Either<Failure, List<ItemHelpEntity>>> getHelp();
}
