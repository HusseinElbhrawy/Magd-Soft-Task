import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magd_soft_task/core/utils/app_assets.dart';
import 'package:magd_soft_task/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            AppSvgAssets.splashBG,
            fit: BoxFit.cover,
          ),
          Image.asset(AppImageAssets.splashLogo),
        ],
      ),
    );
  }
}
