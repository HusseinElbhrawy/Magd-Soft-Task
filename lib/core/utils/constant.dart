import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';
import 'media_query_values.dart';
import 'values_managers.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Constant {
  static Widget horizontalDivider() => const Divider(color: Colors.transparent);
  static Widget verticalDivider() =>
      const VerticalDivider(color: Colors.transparent);

  static Size fixedElevatedButtonSize(BuildContext context) {
    return Size(
      context.width / AppSize.s1_3,
      context.height / AppSize.s20,
    );
  }

  static int pinPutLength = 4;

  static void warningToast(BuildContext context, String title, String desc,
          {MotionToastPosition? position}) =>
      MotionToast.warning(
        title: Text(title, style: const TextStyle(color: AppColors.black)),
        toastDuration: const Duration(seconds: 2),
        dismissable: true,
        enableAnimation: true,
        animationDuration: const Duration(seconds: 2),
        description: Text(desc, style: const TextStyle(color: AppColors.black)),
        position: position ?? MotionToastPosition.bottom,
      ).show(context);

  static void errorToast(BuildContext context, String desc,
          {MotionToastPosition? position}) =>
      MotionToast.error(
        title: const Text(AppStrings.error),
        toastDuration: const Duration(seconds: 2),
        dismissable: true,
        enableAnimation: true,
        animationDuration: const Duration(seconds: 2),
        description: Text(desc),
        position: position ?? MotionToastPosition.bottom,
      ).show(context);

  static const skipAuth = 'SKIP';
}
