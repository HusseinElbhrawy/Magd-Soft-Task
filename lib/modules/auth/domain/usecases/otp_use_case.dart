import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/auth_repository.dart';

class OtpUseCase extends UseCases<dynamic, OtpData> {
  final AuthRepository authRepository;

  OtpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, dynamic>> call(OtpData params) async {
    return await authRepository.otp(params);
  }
}
