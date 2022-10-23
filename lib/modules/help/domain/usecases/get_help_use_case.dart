import '../../../../core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/item_help_entity.dart';
import '../repositories/help_repository.dart';

class GetHelpUseCase extends UseCases<List<ItemHelpEntity>, NoParams> {
  final HelpRepository helpRepository;

  GetHelpUseCase({required this.helpRepository});
  @override
  Future<Either<Failure, List<ItemHelpEntity>>> call(NoParams params) async {
    return await helpRepository.getHelp();
  }
}
