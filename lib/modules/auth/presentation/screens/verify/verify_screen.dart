import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injector.dart';
import '../../../../../core/usecases/params/params.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../bloc/verify/verify_phone_bloc.dart';
import '../../widgets/verify/custom_verify_app_bar_widget.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({
    Key? key,
    required this.otpData,
  }) : super(key: key);
  final OtpData otpData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          serviceLocator<VerifyPhoneBloc>()..add(AssignCodeEvent(otpData)),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomVerifyAppBarWidget(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BlocBuilder<VerifyPhoneBloc, VerifyPhoneState>(
                    builder: (context, state) => ResendCodeButtonWidget(
                      state: state,
                      otpData: otpData,
                    ),
                  ),
                  Constant.horizontalDivider(),
                  BlocBuilder<VerifyPhoneBloc, VerifyPhoneState>(
                    builder: (context, state) => VerifyButtonWidget(
                      otpData: otpData,
                      state: state,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResendCodeButtonWidget extends StatelessWidget {
  const ResendCodeButtonWidget({
    Key? key,
    required this.state,
    required this.otpData,
  }) : super(key: key);
  final VerifyPhoneState state;
  final OtpData otpData;
  @override
  Widget build(BuildContext context) {
    switch (state.resendRequestState) {
      case RequestState.loading:
        return TextButton(
          style: TextButton.styleFrom(
            fixedSize: Constant.fixedElevatedButtonSize(context),
          ),
          onPressed: null,
          child: const CircularProgressIndicator.adaptive(),
        );
      case RequestState.loaded:
        return TextButton(
          onPressed: () {
            context
                .read<VerifyPhoneBloc>()
                .add(ResendCodeEvent(context, otpData));
          },
          child: const Text(AppStrings.resendCode),
        );
      case RequestState.error:
        return Container();
    }
  }
}

class VerifyButtonWidget extends StatelessWidget {
  const VerifyButtonWidget(
      {Key? key, required this.otpData, required this.state})
      : super(key: key);
  final VerifyPhoneState state;
  final OtpData otpData;
  @override
  Widget build(BuildContext context) {
    switch (state.verifyRequestState) {
      case RequestState.loading:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Constant.fixedElevatedButtonSize(context),
          ),
          onPressed: null,
          child: const CircularProgressIndicator.adaptive(),
        );

      case RequestState.loaded:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Constant.fixedElevatedButtonSize(context),
          ),
          onPressed: () {
            context.read<VerifyPhoneBloc>().add(
                  VerifyCodeEvent(
                    context,
                    otpData,
                  ),
                );
          },
          child: const Text(AppStrings.verify),
        );
      case RequestState.error:
        return Container();
    }
  }
}
