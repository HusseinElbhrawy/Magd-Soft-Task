import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/values_managers.dart';
import 'package:pinput/pinput.dart';

import '../../bloc/verify/verify_phone_bloc.dart';

class CustomVerifyAppBarWidget extends StatelessWidget {
  const CustomVerifyAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.height / AppSize.s2,
      title: Text(
        AppStrings.verifyPhone,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: AppColors.white),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.primary.withOpacity(.5),
              AppColors.primary.withOpacity(.3),
              AppColors.white,
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Builder(builder: (context) {
          return Pinput(
            controller: context.read<VerifyPhoneBloc>().pinPutController,
            hapticFeedbackType: HapticFeedbackType.heavyImpact,
            closeKeyboardWhenCompleted: false,
            textInputAction: TextInputAction.done,

            autofocus: true,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            // errorText:AppStrings.pinputError,
            length: Constant.pinPutLength,
          );
        }),
      ),
    );
  }
}
