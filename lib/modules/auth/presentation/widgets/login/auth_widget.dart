import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_colors.dart';
import 'package:magd_soft_task/core/utils/app_strings.dart';
import 'package:magd_soft_task/core/utils/constant.dart';
import 'package:magd_soft_task/core/utils/media_query_values.dart';
import 'package:magd_soft_task/core/utils/values_managers.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/social_media_auth_button_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: AppStrings.enterName,
                ),
              ),
              Constant.horizontalDivider(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: AppStrings.enterNumber,
                ),
              ),
              Constant.horizontalDivider(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    context.width / AppSize.s2,
                    context.height / AppSize.s20,
                  ),
                ),
                onPressed: () {},
                child: const Text(AppStrings.login),
              ),
              if (!context.isPortrait) ...[
                Constant.horizontalDivider(),
                const SocialMediaAuthButtonWidget()
              ]
            ],
          ),
        ),
      ),
    );
  }
}
