import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/usecases/params/params.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../splash/presentation/bloc/splash_bloc.dart';
import '../../../domain/usecases/otp_use_case.dart';
import '../../../domain/usecases/verify_phone_use_case.dart';

part 'verify_phone_event.dart';
part 'verify_phone_state.dart';

class VerifyPhoneBloc extends Bloc<VerifyPhoneEvent, VerifyPhoneState> {
  late TextEditingController pinPutController = TextEditingController();

  final OtpUseCase otpUseCase;

  final VerifyPhoneUseCase verifyPhoneUseCase;
  final SplashBloc splashBloc;
  VerifyPhoneBloc({
    required this.splashBloc,
    required this.verifyPhoneUseCase,
    required this.otpUseCase,
  }) : super(const VerifyPhoneState()) {
    on<AssignCodeEvent>(
        (event, emit) => pinPutController.text = event.otpData.code);
    on<VerifyCodeEvent>((event, emit) => _verify(event));
    on<ResendCodeEvent>((event, emit) => _resendCode(event));
  }

  void _verify(VerifyCodeEvent event) async {
    emit(state.copyWith(verifyRequestState: RequestState.loading));

    final result = await otpUseCase.call(event.otpData);
    emit(
      result.fold(
        (failure) {
          Constant.errorToast(event.context, failure.message);
          return state.copyWith(
            verifyRequestState: RequestState.error,
            errorMessage: failure.message,
          );
        },
        (response) {
          splashBloc.skipAuth();
          Navigator.pushReplacementNamed(event.context, Routes.helpRoute);
          return state.copyWith(verifyRequestState: RequestState.loaded);
        },
      ),
    );
  }

  void _resendCode(ResendCodeEvent event) async {
    emit(state.copyWith(resendRequestState: RequestState.loading));

    final result = await verifyPhoneUseCase.call(
      VerifyPhoneData(
        phoneNumber: event.otpData.phoneNumber,
        name: 'S',
      ),
    );
    emit(
      result.fold(
        (failure) {
          Constant.errorToast(event.context, failure.message);
          return state.copyWith(
            resendRequestState: RequestState.error,
            errorMessage: failure.message,
          );
        },
        (response) {
          pinPutController.text = response.code;
          Constant.warningToast(
            event.context,
            'Warning',
            'The new one ${response.code}',
          );
          return state.copyWith(resendRequestState: RequestState.loaded);
        },
      ),
    );
  }

  @override
  Future<void> close() {
    pinPutController.dispose();
    return super.close();
  }
}
