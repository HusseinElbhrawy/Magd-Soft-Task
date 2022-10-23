import 'dart:developer';

import '../../../../core/api/error_handler_codes.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/error/errors.dart';
import 'package:dartz/dartz.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/otp_entity.dart';
import '../../domain/entities/verify_phone_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplementation({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, OtpEntity>> otp(OtpData otpData) async {
    try {
      final result = await authRemoteDataSource.otp(otpData);
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, VerifyPhoneEntity>> verifyPhone(
      VerifyPhoneData verifyPhoneData) async {
    try {
      final result = await authRemoteDataSource.verifyPhone(verifyPhoneData);
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
