import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/usecases/params/params.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_all_products_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<GetHomeProductEvent, HomeState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  final pageController = PageController(viewportFraction: .8);

  List<Map> category = [
    {
      'name': 'All',
      'image': AppImageAssets.all,
    },
    {
      'name': 'Acer',
      'image': AppImageAssets.predatorLogo,
    },
    {
      'name': 'Razer',
      'image': AppImageAssets.razerLogo,
    },
  ];

  HomeBloc({
    required this.getAllProductsUseCase,
  }) : super(const HomeState()) {
    on<GetHomeProductEvent>((event, emit) => _getAllProducts(event));
  }

  void _getAllProducts(GetHomeProductEvent event) async {
    emit(state.copyWith(getAllProductRequestState: RequestState.loading));
    final result = await getAllProductsUseCase.call(NoParams());
    emit(
      result.fold(
        (failure) {
          Constant.errorToast(event.context, failure.message);
          debugPrint(failure.message);
          return state.copyWith(
            getAllProductRequestState: RequestState.error,
            errorMessage: failure.message,
          );
        },
        (response) {
          return state.copyWith(
            getAllProductRequestState: RequestState.loaded,
            products: response,
          );
        },
      ),
    );
  }
}
