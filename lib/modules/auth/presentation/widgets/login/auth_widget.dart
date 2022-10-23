import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/values_managers.dart';
import '../../bloc/login/login_bloc.dart';
import 'social_media_auth_button_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Align(
        alignment: AlignmentDirectional.center,
        heightFactor: context.isPortrait ? AppSize.s2 : null,
        child: Material(
          elevation: 30,
          borderRadius: BorderRadius.circular(AppSize.s16),
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p24),
            width: context.isPortrait
                ? context.width / AppSize.s1_3
                : context.width / AppSize.s2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.welcome,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: const EdgeInsets.all(AppMargin.m8),
                  width: context.width / AppSize.s3,
                  height: AppSize.s2,
                  color: AppColors.primary,
                ),
                Constant.horizontalDivider(),
                TextFormField(
                  controller: context.read<LoginBloc>().nameController,
                  validator: (value) =>
                      context.read<LoginBloc>().nameValidator(),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: AppStrings.enterName,
                  ),
                ),
                Constant.horizontalDivider(),
                TextFormField(
                  controller: context.read<LoginBloc>().phoneController,
                  validator: (value) =>
                      context.read<LoginBloc>().phoneValidator(),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) => context
                      .read<LoginBloc>()
                      .add(LoginEvent(context: context)),
                  focusNode: context.read<LoginBloc>().phoneFocusNode,
                  decoration: const InputDecoration(
                    hintText: AppStrings.enterNumber,
                  ),
                ),
                Constant.horizontalDivider(),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    switch (state.requestState) {
                      case RequestState.loading:
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Constant.fixedElevatedButtonSize(context),
                          ),
                          onPressed: null,
                          child: const CircularProgressIndicator.adaptive(),
                        );
                      case RequestState.loaded:
                        return const AuthButton();
                      case RequestState.error:
                        return const AuthButton();
                    }
                  },
                ),
                if (!context.isPortrait) ...[
                  Constant.horizontalDivider(),
                  const SocialMediaAuthButtonWidget()
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Constant.fixedElevatedButtonSize(context),
      ),
      onPressed: () {
        context.read<LoginBloc>().add(LoginEvent(context: context));
      },
      child: const Text(AppStrings.login),
    );
  }
}
