import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/injector.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          serviceLocator<SplashBloc>()..add(SplashEvent(context: context)),
      child: Scaffold(
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
      ),
    );
  }
}
