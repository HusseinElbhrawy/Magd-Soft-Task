import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/database/secure_local_storage.dart';
import '../../../../core/utils/constant.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  late Timer timer;
  final SecureLocalStorage secureLocalStorage;

  SplashBloc({
    required this.secureLocalStorage,
  }) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      timer = Timer(
        const Duration(milliseconds: 1500),
        () => _timerCallBack(event.context),
      );
    });
  }

  void _timerCallBack(BuildContext context) async {
    final String value = await _isFirstTime();
    if (value.isEmpty) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    }
  }

  Future<String> _isFirstTime() async {
    return await secureLocalStorage.readValue(Constant.skipAuth) ?? '';
  }

  void skipAuth() async {
    //! yup , we here can use code(OTP) as a value XD)
    return await secureLocalStorage.writeValue(Constant.skipAuth, 'YES');
  }

  @override
  Future<void> close() {
    timer.cancel();
    debugPrint('timer closed');
    return super.close();
  }
}
