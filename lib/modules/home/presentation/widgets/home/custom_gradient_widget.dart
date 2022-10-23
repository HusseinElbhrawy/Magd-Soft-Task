import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/media_query_values.dart';

import '../../../../../core/utils/values_managers.dart';

class CustomGradientWidget extends StatelessWidget {
  const CustomGradientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        height: context.height / AppSize.s3,
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
      ),
    );
  }
}
