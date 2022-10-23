// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.errorMessage = '',
    this.getAllProductRequestState = RequestState.loaded,
    this.products = const [],
  });
  final RequestState getAllProductRequestState;
  final List<ProductEntity> products;
  final String errorMessage;
  @override
  List<Object> get props => [
        errorMessage,
        getAllProductRequestState,
        products,
      ];

  HomeState copyWith({
    RequestState? getAllProductRequestState,
    List<ProductEntity>? products,
    String? errorMessage,
  }) {
    return HomeState(
      getAllProductRequestState:
          getAllProductRequestState ?? this.getAllProductRequestState,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
