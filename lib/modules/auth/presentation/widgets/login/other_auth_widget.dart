import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_colors.dart';
import 'package:magd_soft_task/core/utils/app_strings.dart';
import 'package:magd_soft_task/core/utils/constant.dart';
import 'package:magd_soft_task/core/utils/media_query_values.dart';
import 'package:magd_soft_task/core/utils/values_managers.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/custom_divider_widget.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/social_media_auth_button_widget.dart';

class OtherAuthWidget extends StatelessWidget {
  const OtherAuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        height: context.isPortrait
            ? context.height / AppSize.s1_5
            : context.height / AppSize.s2,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(50),
            topStart: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            if (context.isPortrait) ...[
              Spacer(flex: AppSize.s2.toInt()),
              Row(
                children: [
                  const CustomDividerWidget(),
                  Text(
                    AppStrings.or,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.primary),
                  ),
                  const CustomDividerWidget(),
                ],
              ),
              Constant.horizontalDivider(),
              const SocialMediaAuthButtonWidget(),
              const Spacer()
            ] else
              Constant.horizontalDivider(),
          ],
        ),
      ),
    );
  }
}
