import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/usecases/params/params.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/usecases/verify_phone_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  final VerifyPhoneUseCase verifyPhoneUseCase;

  LoginBloc({
    required this.verifyPhoneUseCase,
  }) : super(const LoginState()) {
    on<LoginEvent>((event, emit) => _login(event.context, emit));
  }

  String? nameValidator() {
    if (nameController.value.text.isEmpty) {
      return 'please, enter valid name';
    }
    return null;
  }

  String? phoneValidator() {
    if (phoneController.value.text.isEmpty ||
        phoneController.value.text.length < 11) {
      return 'please, enter phone number';
    }
    return null;
  }

  void _login(BuildContext context, Function emit) async {
    if (formKey.currentState!.validate()) {
      phoneFocusNode.unfocus();
      emit(const LoginState(requestState: RequestState.loading));
      final result = await verifyPhoneUseCase.call(
        VerifyPhoneData(
          phoneNumber: phoneController.value.text,
          name: nameController.value.text,
        ),
      );
      emit(
        result.fold(
          (failure) {
            Constant.errorToast(
              context,
              failure.message,
            );
            return LoginState(
              requestState: RequestState.error,
              errorMessage: failure.message,
            );
          },
          (response) {
            Constant.warningToast(
              context,
              response.message,
              response.code,
            );

            Timer(
              const Duration(seconds: 3),
              () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.verifyRoute,
                  arguments: OtpData(
                    phoneNumber: phoneController.text,
                    code: response.code,
                  ),
                );
              },
            );

            return const LoginState(requestState: RequestState.loaded);
          },
        ),
      );
    }
  }
}
