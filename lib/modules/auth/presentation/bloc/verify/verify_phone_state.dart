// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verify_phone_bloc.dart';

class VerifyPhoneState extends Equatable {
  const VerifyPhoneState({
    this.verifyRequestState = RequestState.loaded,
    this.resendRequestState = RequestState.loaded,
    this.errorMessage = '',
  });
  final RequestState verifyRequestState;
  final RequestState resendRequestState;
  final String errorMessage;

  @override
  List<Object> get props =>
      [verifyRequestState, errorMessage, resendRequestState];

  VerifyPhoneState copyWith({
    RequestState? verifyRequestState,
    RequestState? resendRequestState,
    String? errorMessage,
  }) {
    return VerifyPhoneState(
      verifyRequestState: verifyRequestState ?? this.verifyRequestState,
      resendRequestState: resendRequestState ?? this.resendRequestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
