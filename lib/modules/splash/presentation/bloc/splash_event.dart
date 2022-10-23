part of 'splash_bloc.dart';

class SplashEvent extends Equatable {
  const SplashEvent({
    required this.context,
  });

  final BuildContext context;

  @override
  List<Object> get props => [context];
}
