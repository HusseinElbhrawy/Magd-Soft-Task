import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/usecases/params/params.dart';
import '../models/otp_model.dart';
import '../models/verify_phone_model.dart';

abstract class AuthRemoteDataSource {
  Future<VerifyPhoneModel> verifyPhone(VerifyPhoneData verifyPhoneData);
  Future<OtpModel> otp(OtpData otpData);
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final DioConsumer dioConsumer;

  AuthRemoteDataSourceImplementation({required this.dioConsumer});
  @override
  Future<OtpModel> otp(OtpData otpData) async {
    final result = await dioConsumer.post(
      EndPoint.otp,
      body: {
        'phone': otpData.phoneNumber,
        'code': otpData.code,
      },
    );
    return OtpModel.fromMap(result);
  }

  @override
  Future<VerifyPhoneModel> verifyPhone(VerifyPhoneData verifyPhoneData) async {
    final result = await dioConsumer.post(
      EndPoint.verifyPhone,
      body: {
        'phone': verifyPhoneData.phoneNumber,
        'name': verifyPhoneData.name,
      },
    );

    return VerifyPhoneModel.fromMap(result);
  }
}
