// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:magd_soft_task/modules/auth/domain/entities/verify_phone_entity.dart';

class VerifyPhoneModel extends VerifyPhoneEntity {
  const VerifyPhoneModel({
    required super.statusCode,
    required super.message,
    required super.code,
  });

  VerifyPhoneModel copyWith({
    int? statusCode,
    String? message,
    String? code,
  }) {
    return VerifyPhoneModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': statusCode,
      'message': message,
      'code': code,
    };
  }

  factory VerifyPhoneModel.fromMap(Map<String, dynamic> map) {
    return VerifyPhoneModel(
      statusCode: map['status'] as int,
      message: map['message'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyPhoneModel.fromJson(String source) =>
      VerifyPhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VerifyPhoneModel(statusCode: $statusCode, message: $message, code: $code)';

  @override
  bool operator ==(covariant VerifyPhoneModel other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        other.code == code;
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ code.hashCode;
}
