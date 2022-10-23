import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/usecases/params/params.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/item_help_entity.dart';
import '../../domain/usecases/get_help_use_case.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  final GetHelpUseCase getHelpUseCase;

  late List<bool> items;

  HelpBloc({
    required this.getHelpUseCase,
  }) : super(const HelpState()) {
    on<HelpEvent>((event, emit) => _getHelp());
  }

  void _getHelp() async {
    emit(state.copyWith(getHelpRequestState: RequestState.loading));
    final result = await getHelpUseCase.call(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            getHelpRequestState: RequestState.error,
            errorMessage: failure.message,
          );
        },
        (response) {
          items = List.generate(response.length, ((index) {
            return index == 0 ? true : false;
          }));
          return state.copyWith(
            getHelpRequestState: RequestState.loaded,
            data: response,
          );
        },
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }
}
