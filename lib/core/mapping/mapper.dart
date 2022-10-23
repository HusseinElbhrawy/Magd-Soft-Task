import '../../modules/auth/data/models/verify_phone_model.dart';
import '../../modules/auth/domain/entities/verify_phone_entity.dart';

extension ConvertFromVerifyModelToEntity on VerifyPhoneModel {
  VerifyPhoneEntity convert() {
    return VerifyPhoneEntity(
      statusCode: statusCode,
      message: message,
      code: code,
    );
  }
}

extension ConvertFromVerifyEntityToModel on VerifyPhoneEntity {
  VerifyPhoneModel convert() {
    return VerifyPhoneModel(
      statusCode: statusCode,
      message: message,
      code: code,
    );
  }
}
