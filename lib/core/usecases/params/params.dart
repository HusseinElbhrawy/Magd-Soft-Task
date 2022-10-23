import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyPhoneData extends Equatable {
  final String phoneNumber;
  final String name;

  const VerifyPhoneData({required this.phoneNumber, required this.name});
  @override
  List<Object?> get props => [name, phoneNumber];
}

class OtpData extends Equatable {
  final String phoneNumber;
  final String code;

  const OtpData({required this.phoneNumber, required this.code});
  @override
  List<Object?> get props => [code, phoneNumber];
}

class ExpansionItem extends Equatable {
  final bool expanded;

  const ExpansionItem({
    required this.expanded,
  });
  @override
  List<Object?> get props => [
        expanded,
      ];
}
