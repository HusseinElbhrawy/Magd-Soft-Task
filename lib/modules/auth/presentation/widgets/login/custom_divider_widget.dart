import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_colors.dart';
import 'package:magd_soft_task/core/utils/media_query_values.dart';
import 'package:magd_soft_task/core/utils/values_managers.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m18),
        width: context.width,
        height: AppSize.s1_5,
        color: AppColors.primary,
      ),
    );
  }
}
