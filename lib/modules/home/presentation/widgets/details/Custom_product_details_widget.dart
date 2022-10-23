import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomProductDetailsWidget extends StatelessWidget {
  const CustomProductDetailsWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.voidCallback,
    required this.isVisible,
  }) : super(key: key);
  final String title;
  final VoidCallback voidCallback;
  final Color color;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            primary: isVisible ? AppColors.primary : AppColors.lightGrey,
          ),
          onPressed: voidCallback,
          child: Text(title),
        ),
        Visibility(
          visible: isVisible,
          child: SizedBox(
            height: 7.5,
            width: 7.5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
