part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final BuildContext context;
  const LoginEvent({
    required this.context,
  });

  @override
  List<Object> get props => [
        context,
      ];
}
