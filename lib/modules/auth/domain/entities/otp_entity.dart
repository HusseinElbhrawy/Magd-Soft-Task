import 'package:equatable/equatable.dart';

class OtpEntity extends Equatable {
  final int statusCode;
  final String message;
  final Map<String, dynamic> account;

  const OtpEntity({
    required this.statusCode,
    required this.message,
    required this.account,
  });

  @override
  List<Object?> get props => [statusCode, message, account];
}
