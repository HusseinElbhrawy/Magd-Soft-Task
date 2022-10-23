// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.errorMessage = '',
    this.requestState = RequestState.loaded,
  });
  final RequestState requestState;
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage, requestState];

  LoginState copyWith({
    RequestState? requestState,
    String? errorMessage,
  }) {
    return LoginState(
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
