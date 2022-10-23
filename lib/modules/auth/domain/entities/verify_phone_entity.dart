import 'package:equatable/equatable.dart';

class VerifyPhoneEntity extends Equatable {
  final int statusCode;
  final String message;
  final String code;

  const VerifyPhoneEntity({
    required this.statusCode,
    required this.message,
    required this.code,
  });
  @override
  List<Object?> get props => [statusCode, message, code];
}
