import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_assets.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/circle_elevated_button_widget.dart';

class SocialMediaAuthButtonWidget extends StatelessWidget {
  const SocialMediaAuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleElevatedButtonWidget(
          imagePath: AppSvgAssets.facebook,
          onTap: () {},
        ),
        CircleElevatedButtonWidget(
          imagePath: AppSvgAssets.apple,
          onTap: () {},
        ),
        CircleElevatedButtonWidget(
          imagePath: AppSvgAssets.google,
          onTap: () {},
        ),
      ],
    );
  }
}
