// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'help_bloc.dart';

class HelpState extends Equatable {
  const HelpState({
    this.data = const [],
    this.getHelpRequestState = RequestState.loaded,
    this.errorMessage = '',
  });
  final RequestState getHelpRequestState;
  final List<ItemHelpEntity> data;
  final String errorMessage;
  @override
  List<Object> get props => [
        data,
        getHelpRequestState,
        errorMessage,
      ];

  HelpState copyWith({
    RequestState? getHelpRequestState,
    List<ItemHelpEntity>? data,
    String? errorMessage,
  }) {
    return HelpState(
      getHelpRequestState: getHelpRequestState ?? this.getHelpRequestState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
