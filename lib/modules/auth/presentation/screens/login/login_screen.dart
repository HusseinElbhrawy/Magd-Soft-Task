import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_assets.dart';
import 'package:magd_soft_task/core/utils/media_query_values.dart';
import 'package:magd_soft_task/core/utils/values_managers.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/auth_widget.dart';
import 'package:magd_soft_task/modules/auth/presentation/widgets/login/other_auth_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //!Image
          SizedBox(
            height: context.isPortrait
                ? context.height / AppSize.s2_5
                : context.height / AppSize.s1_5,
            width: double.infinity,
            child: Image.asset(
              AppImageAssets.loginLogo,
              fit: BoxFit.fill,
            ),
          ),
          //! Auth and other auth method widget
          Stack(
            children: const [
              OtherAuthWidget(),
              AuthWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
