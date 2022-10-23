import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/usecases/params/params.dart';
import '../entities/verify_phone_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, VerifyPhoneEntity>> verifyPhone(
      VerifyPhoneData verifyPhoneData);
  Future<Either<Failure, dynamic>> otp(OtpData otpData);
}
