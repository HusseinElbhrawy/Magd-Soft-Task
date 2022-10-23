import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomDetailsScreenAppBar extends StatelessWidget {
  const CustomDetailsScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      stretch: true,
      backgroundColor: AppColors.primary,
      elevation: 0.0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(30, 45),
                  primary: AppColors.white,
                  onPrimary: AppColors.grey,
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
