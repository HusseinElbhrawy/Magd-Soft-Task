import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/values_managers.dart';

class CircleElevatedButtonWidget extends StatelessWidget {
  const CircleElevatedButtonWidget({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(AppPadding.p12),
        shape: const CircleBorder(),
        primary: AppColors.white,
      ),
      onPressed: onTap,
      child: SvgPicture.asset(
        imagePath,
        height: AppSize.s18,
        fit: BoxFit.fill,
      ),
    );
  }
}
