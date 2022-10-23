import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  const OtpModel({
    required super.statusCode,
    required super.message,
    required super.account,
  });

  OtpModel copyWith({
    int? statusCode,
    String? message,
    Map<String, dynamic>? account,
  }) {
    return OtpModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      account: account ?? this.account,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': statusCode,
      'message': message,
      'account': account,
    };
  }

  factory OtpModel.fromMap(Map<String, dynamic> map) {
    return OtpModel(
      statusCode: map['status'] as int,
      message: map['message'] as String,
      account: Map<String, dynamic>.from(
        (map['account'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpModel.fromJson(String source) =>
      OtpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OtpModel(statusCode: $statusCode, message: $message, account: $account)';

  @override
  bool operator ==(covariant OtpModel other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        mapEquals(other.account, account);
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ account.hashCode;
}
