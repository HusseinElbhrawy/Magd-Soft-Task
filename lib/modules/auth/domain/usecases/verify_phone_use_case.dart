import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/verify_phone_entity.dart';
import '../repositories/auth_repository.dart';

class VerifyPhoneUseCase extends UseCases<VerifyPhoneEntity, VerifyPhoneData> {
  final AuthRepository authRepository;

  VerifyPhoneUseCase({required this.authRepository});
  @override
  Future<Either<Failure, VerifyPhoneEntity>> call(
      VerifyPhoneData params) async {
    return await authRepository.verifyPhone(params);
  }
}
