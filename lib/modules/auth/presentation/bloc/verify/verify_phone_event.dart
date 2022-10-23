part of 'verify_phone_bloc.dart';

abstract class VerifyPhoneEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AssignCodeEvent extends VerifyPhoneEvent {
  final OtpData otpData;

  AssignCodeEvent(this.otpData);
  @override
  List<Object> get props => [otpData];
}

class VerifyCodeEvent extends VerifyPhoneEvent {
  final BuildContext context;
  final OtpData otpData;

  VerifyCodeEvent(this.context, this.otpData);
  @override
  List<Object> get props => [context, otpData];
}

class ResendCodeEvent extends VerifyPhoneEvent {
  final BuildContext context;
  final OtpData otpData;

  ResendCodeEvent(this.context, this.otpData);
  @override
  List<Object> get props => [context, otpData];
}
