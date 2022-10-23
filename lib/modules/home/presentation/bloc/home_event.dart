part of 'home_bloc.dart';

class GetHomeProductEvent extends Equatable {
  const GetHomeProductEvent({
    required this.context,
  });
  final BuildContext context;
  @override
  List<Object> get props => [context];
}
